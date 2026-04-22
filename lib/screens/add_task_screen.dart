import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_form.dart';
import '../utils/app_colors.dart';

/// Pantalla para crear una nueva tarea
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Tarea'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: TaskForm(
        submitButtonText: 'Crear Tarea',
        onSubmit: (title, description, dueDate) {
          context.read<TaskProvider>().addTask(
            title: title,
            description: description,
            dueDate: dueDate,
          );
        },
      ),
    );
  }
}
