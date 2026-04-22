import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;
import '../services/database.dart';
import '../services/mock_task_source.dart';

/// Enum para los filtros de tareas
enum TaskFilter { all, pending, completed }

/// Proveedor de estado para la gestión de tareas
class TaskProvider extends ChangeNotifier {
  final AppDatabase _database;
  
  List<TaskDb> _allTasks = [];
  TaskFilter _currentFilter = TaskFilter.all;
  bool _isLoading = false;
  String? _errorMessage;

  TaskProvider(this._database) {
    _loadTasks();
  }

  /// Getters
  List<TaskDb> get tasks {
    switch (_currentFilter) {
      case TaskFilter.all:
        return _allTasks;
      case TaskFilter.pending:
        return _allTasks.where((t) => !t.isCompleted).toList();
      case TaskFilter.completed:
        return _allTasks.where((t) => t.isCompleted).toList();
    }
  }

  TaskFilter get currentFilter => _currentFilter;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Carga todas las tareas desde la base de datos
  Future<void> _loadTasks() async {
    _setLoading(true);
    try {
      _allTasks = await _database.getAllTasks();

      // Si no hay datos, cargamos una simulacion estructurada inicial.
      if (_allTasks.isEmpty) {
        await _seedFromMockSource();
        _allTasks = await _database.getAllTasks();
      }

      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Error al cargar tareas: $e';
    } finally {
      _setLoading(false);
    }
  }

  /// Recarga las tareas
  Future<void> refreshTasks() async {
    await _loadTasks();
  }

  /// Agrega una nueva tarea
  Future<void> addTask({
    required String title,
    required String description,
    DateTime? dueDate,
  }) async {
    try {
      _errorMessage = null;
      final newTask = TasksCompanion(
        title: Value(title),
        description: Value(description),
        dueDate: Value(dueDate),
      );
      await _database.insertTask(newTask);
      await _loadTasks();
    } catch (e) {
      _errorMessage = 'Error al agregar tarea: $e';
    }
    notifyListeners();
  }

  /// Actualiza una tarea existente
  Future<void> updateTask({
    required int id,
    required String title,
    required String description,
    DateTime? dueDate,
  }) async {
    try {
      _errorMessage = null;
      final updatedTask = TasksCompanion(
        id: Value(id),
        title: Value(title),
        description: Value(description),
        dueDate: Value(dueDate),
      );
      await _database.updateTask(updatedTask);
      await _loadTasks();
    } catch (e) {
      _errorMessage = 'Error al actualizar tarea: $e';
    }
    notifyListeners();
  }

  /// Cambia el estado de completado de una tarea
  Future<void> toggleTask(int id, bool isCompleted) async {
    try {
      _errorMessage = null;
      await _database.toggleTaskCompletion(id, isCompleted);
      await _loadTasks();
    } catch (e) {
      _errorMessage = 'Error al actualizar tarea: $e';
    }
    notifyListeners();
  }

  /// Elimina una tarea
  Future<void> deleteTask(int id) async {
    try {
      _errorMessage = null;
      await _database.deleteTask(id);
      await _loadTasks();
    } catch (e) {
      _errorMessage = 'Error al eliminar tarea: $e';
    }
    notifyListeners();
  }

  /// Cambia el filtro actual
  void setFilter(TaskFilter filter) {
    _currentFilter = filter;
    notifyListeners();
  }

  /// Establece el estado de carga
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> _seedFromMockSource() async {
    final mockTasks = MockTaskSource.getInitialTasks();
    for (final item in mockTasks) {
      await _database.insertTask(
        TasksCompanion(
          title: Value(item['title'] as String),
          description: Value(item['description'] as String),
          isCompleted: Value(item['isCompleted'] as bool),
        ),
      );
    }
  }
}

