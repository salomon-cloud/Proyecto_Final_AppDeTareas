class MockTaskSource {
  // Simulacion de datos estructurados (como respuesta de API)
  static List<Map<String, dynamic>> getInitialTasks() {
    return [
      {
        'title': 'Preparar demo del proyecto',
        'description': 'Ensayar la presentacion de 5 minutos para clase',
        'isCompleted': false,
      },
      {
        'title': 'Subir codigo a GitHub',
        'description': 'Verificar README y estructura final del repositorio',
        'isCompleted': false,
      },
      {
        'title': 'Generar APK release',
        'description': 'Compilar apk y probar instalacion en Android',
        'isCompleted': false,
      },
    ];
  }
}
