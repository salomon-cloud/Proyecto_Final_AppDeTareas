import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

/// Widget que proporciona un formulario para crear/editar tareas
class TaskForm extends StatefulWidget {
  final String? initialTitle;
  final String? initialDescription;
  final DateTime? initialDueDate;
  final Function(String, String, DateTime?)? onSubmit;
  final String submitButtonText;

  const TaskForm({
    Key? key,
    this.initialTitle,
    this.initialDescription,
    this.initialDueDate,
    this.onSubmit,
    this.submitButtonText = 'Guardar',
  }) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  DateTime? _selectedDueDate;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle);
    _descriptionController =
        TextEditingController(text: widget.initialDescription);
    _selectedDueDate = widget.initialDueDate;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDueDate = pickedDate;
      });
    }
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        widget.onSubmit?.call(
          _titleController.text.trim(),
          _descriptionController.text.trim(),
          _selectedDueDate,
        );

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Tarea guardada correctamente'),
              backgroundColor: AppColors.successColor,
              duration: const Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: $e'),
              backgroundColor: AppColors.errorColor,
            ),
          );
        }
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Título de la tarea *',
                labelStyle: const TextStyle(color: AppColors.primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: AppColors.primaryColor, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: AppColors.primaryColor, width: 2),
                ),
                prefixIcon: const Icon(Icons.title, color: AppColors.primaryColor),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Por favor ingresa un título';
                }
                if (value.length < 3) {
                  return 'El título debe tener al menos 3 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Descripción
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Descripción (opcional)',
                labelStyle: const TextStyle(color: AppColors.primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: AppColors.primaryColor, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: AppColors.primaryColor, width: 2),
                ),
                prefixIcon:
                    const Icon(Icons.description, color: AppColors.primaryColor),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              maxLines: 3,
              minLines: 2,
            ),
            const SizedBox(height: 16),

            // Fecha de vencimiento
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Fecha de vencimiento (opcional)',
                  labelStyle: const TextStyle(color: AppColors.primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor,
                      width: 2,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.calendar_today,
                      color: AppColors.primaryColor),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
                child: Text(
                  _selectedDueDate == null
                      ? 'Seleccionar fecha'
                      : '${_selectedDueDate!.day}/${_selectedDueDate!.month}/${_selectedDueDate!.year}',
                  style: TextStyle(
                    fontSize: 16,
                    color: _selectedDueDate == null ? Colors.grey : Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Botón de guardar
            ElevatedButton(
              onPressed: _isLoading ? null : _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      widget.submitButtonText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
