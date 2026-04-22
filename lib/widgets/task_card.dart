import 'package:flutter/material.dart';
import '../services/database.dart';
import '../utils/app_colors.dart';

/// Widget que muestra una tarea como tarjeta
class TaskCard extends StatelessWidget {
  final TaskDb task;
  final VoidCallback onDelete;
  final VoidCallback onTap;
  final Function(bool)? onToggle;

  const TaskCard({
    Key? key,
    required this.task,
    required this.onDelete,
    required this.onTap,
    this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            onToggle?.call(value ?? false);
          },
          activeColor: AppColors.primaryColor,
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: task.isCompleted ? Colors.grey : Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              task.description.isEmpty ? 'Sin descripción' : task.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
            if (task.dueDate != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Vence: ${_formatDate(task.dueDate!)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: _isDueSoon(task.dueDate!) ? Colors.red : Colors.grey,
                  ),
                ),
              ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
        onTap: onTap,
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  bool _isDueSoon(DateTime dueDate) {
    final now = DateTime.now();
    final difference = dueDate.difference(now);
    return difference.inDays <= 1 && difference.isNegative == false;
  }
}
