import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

/// Tabla de tareas en la base de datos
@DataClassName('TaskDb')
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().withDefault(Constant(''))();
  BoolColumn get isCompleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get dueDate => dateTime().nullable()();
}

/// Base de datos principal de la aplicación
@DriftDatabase(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// Obtiene todas las tareas
  Future<List<TaskDb>> getAllTasks() => select(tasks).get();

  /// Obtiene las tareas incompletas
  Future<List<TaskDb>> getIncompleteTasks() =>
      (select(tasks)..where((t) => t.isCompleted.equals(false))).get();

  /// Obtiene las tareas completadas
  Future<List<TaskDb>> getCompletedTasks() =>
      (select(tasks)..where((t) => t.isCompleted.equals(true))).get();

  /// Obtiene una tarea por ID
  Future<TaskDb?> getTaskById(int id) =>
      (select(tasks)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Inserta una nueva tarea
  Future<int> insertTask(TasksCompanion task) => into(tasks).insert(task);

  /// Actualiza una tarea existente
  Future<void> updateTask(TasksCompanion task) async =>
      update(tasks).replace(task as TaskDb);

  /// Elimina una tarea por ID
  Future<int> deleteTask(int id) =>
      (delete(tasks)..where((t) => t.id.equals(id))).go();

  /// Marca una tarea como completada
  Future<void> toggleTaskCompletion(int id, bool isCompleted) async {
    await (update(tasks)..where((t) => t.id.equals(id)))
        .write(TasksCompanion(isCompleted: Value(isCompleted)));
  }

  /// Elimina todas las tareas completadas
  Future<int> deleteAllCompleted() =>
      (delete(tasks)..where((t) => t.isCompleted.equals(true))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
