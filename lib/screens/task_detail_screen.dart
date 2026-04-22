import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../services/database.dart';
import '../widgets/task_form.dart';
import '../utils/app_colors.dart';

/// Pantalla que muestra o edita el detalle de una tarea
class TaskDetailScreen extends StatefulWidget {
  final int taskId;

  const TaskDetailScreen({
    Key? key,
    required this.taskId,
  }) : super(key: key);

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  TaskDb? _task;
  bool _isLoading = true;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _loadTask();
  }

  Future<void> _loadTask() async {
    final db = context.read<TaskProvider>();
    // Buscar la tarea en la lista de Provider
    final tasks = db.tasks;
    for (var task in tasks) {
      if (task.id == widget.taskId) {
        setState(() {
          _task = task;
          _isLoading = false;
        });
        return;
      }
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar Tarea' : 'Detalle de Tarea'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                setState(() => _isEditing = true);
              },
            ),
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() => _isEditing = false);
              },
            ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            )
          : _task == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 80,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Tarea no encontrada',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : _isEditing
                  ? TaskForm(
                      initialTitle: _task!.title,
                      initialDescription: _task!.description,
                      initialDueDate: _task!.dueDate,
                      submitButtonText: 'Actualizar Tarea',
                      onSubmit: (title, description, dueDate) {
                        context.read<TaskProvider>().updateTask(
                          id: _task!.id,
                          title: title,
                          description: description,
                          dueDate: dueDate,
                        );
                        setState(() => _isEditing = false);
                      },
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tarjeta de estado
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: _task!.isCompleted,
                                    onChanged: (value) {
                                      context.read<TaskProvider>().toggleTask(
                                        _task!.id,
                                        value ?? false,
                                      );
                                      setState(() {
                                        _task = _task!.copyWith(
                                            isCompleted: value ?? false);
                                      });
                                    },
                                    activeColor: AppColors.primaryColor,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Estado',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          _task!.isCompleted
                                              ? 'Completada'
                                              : 'Pendiente',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: _task!.isCompleted
                                                ? AppColors.successColor
                                                : Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Título
                          Text(
                            'Título',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _task!.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 24),

                          // Descripción
                          Text(
                            'Descripción',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _task!.description.isEmpty
                                ? 'Sin descripción'
                                : _task!.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 24),

                          // Fecha de vencimiento
                          if (_task!.dueDate != null) ...[
                            Text(
                              'Fecha de Vencimiento',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today,
                                    color: AppColors.primaryColor),
                                const SizedBox(width: 12),
                                Text(
                                  '${_task!.dueDate!.day}/${_task!.dueDate!.month}/${_task!.dueDate!.year}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],

                          // Fecha de creación
                          Text(
                            'Creada',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${_task!.createdAt.day}/${_task!.createdAt.month}/${_task!.createdAt.year}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
    );
  }
}
