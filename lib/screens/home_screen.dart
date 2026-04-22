import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_card.dart';
import '../utils/app_colors.dart';
import 'add_task_screen.dart';
import 'task_detail_screen.dart';

/// Pantalla principal que muestra la lista de tareas
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<TaskProvider>().refreshTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Tareas'),
        elevation: 2,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              context.read<TaskProvider>().setFilter(value);
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: TaskFilter.all,
                child: Row(
                  children: [
                    Icon(Icons.list, color: AppColors.primaryColor),
                    SizedBox(width: 12),
                    Text('Todas'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: TaskFilter.pending,
                child: Row(
                  children: [
                    Icon(Icons.pending_actions, color: Colors.orange),
                    SizedBox(width: 12),
                    Text('Pendientes'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: TaskFilter.completed,
                child: Row(
                  children: [
                    Icon(Icons.done_all, color: Colors.green),
                    SizedBox(width: 12),
                    Text('Completadas'),
                  ],
                ),
              ),
            ],
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          if (taskProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }

          if (taskProvider.tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    taskProvider.currentFilter == TaskFilter.completed
                        ? Icons.sentiment_dissatisfied
                        : Icons.task_alt,
                    size: 80,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    taskProvider.currentFilter == TaskFilter.pending
                        ? 'No hay tareas pendientes'
                        : taskProvider.currentFilter == TaskFilter.completed
                            ? 'No hay tareas completadas'
                            : 'No hay tareas aún',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddTaskScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Crear nueva tarea'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => taskProvider.refreshTasks(),
            color: AppColors.primaryColor,
            child: ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index];
                return TaskCard(
                  task: task,
                  onDelete: () {
                    _showDeleteConfirmation(context, task.id, taskProvider);
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetailScreen(
                          taskId: task.id,
                        ),
                      ),
                    );
                  },
                  onToggle: (isCompleted) {
                    taskProvider.toggleTask(task.id, isCompleted);
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    int taskId,
    TaskProvider taskProvider,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar tarea'),
          content: const Text('¿Está seguro de que desea eliminar esta tarea?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                taskProvider.deleteTask(taskId);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tarea eliminada'),
                    backgroundColor: AppColors.errorColor,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
