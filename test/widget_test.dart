import 'package:flutter_test/flutter_test.dart';
import 'package:examen_final/models/task.dart';

void main() {
  test('Task copyWith actualiza solo los campos indicados', () {
    final base = Task(
      id: 1,
      title: 'Estudiar Flutter',
      description: 'Repasar Provider y Drift',
      isCompleted: false,
      createdAt: DateTime(2026, 4, 13),
      dueDate: DateTime(2026, 4, 20),
    );

    final updated = base.copyWith(title: 'Estudiar para examen', isCompleted: true);

    expect(updated.id, 1);
    expect(updated.title, 'Estudiar para examen');
    expect(updated.description, 'Repasar Provider y Drift');
    expect(updated.isCompleted, true);
    expect(updated.dueDate, DateTime(2026, 4, 20));
  });
}
