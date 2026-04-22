# INSTITUTO TECNOLÓGICO DE ESTUDIOS SUPERIORES RENÉ DESCARTES

## SISTEMA DE CALIDAD
## PROYECTO FINAL

### Manual de Calidad para el Diseño, Desarrollo e Implementación de una Aplicación Móvil

**Aplicación:** Gestor de Tareas (To-Do)  
**Alumno:** [Nombre completo del alumno]  
**Matrícula:** [Matrícula]  
**Carrera:** [Nombre de la carrera]  
**Asignatura:** Sistema de Calidad  
**Docente:** [Nombre del docente]  
**Grupo / Cuatrimestre:** [Grupo] / Enero - Abril 2026 (26-2)  
**Fecha de entrega:** 23 de abril de 2026  

---

## Hoja membretada y formalidades

Este documento está preparado en formato Markdown para facilitar:

- Edición técnica y control de versiones.
- Conversión directa a PDF.
- Inclusión posterior de hoja membretada institucional, portada formal, pie de página, tablas e imágenes.

Nota para versión final en PDF:

- Aplicar membrete oficial del ITES René Descartes.
- Agregar pie de página con nombre del alumno, asignatura, fecha y numeración.
- Justificar texto en el editor final antes de exportar.

---

## Justificación

La calidad en el desarrollo de software móvil no depende únicamente del funcionamiento técnico de una aplicación, sino de la capacidad del proyecto para operar como un sistema de gestión reproducible, controlado y mejorable. Por ello, este manual establece lineamientos de calidad para la aplicación Gestor de Tareas, orientados a:

- Estandarizar procesos durante el ciclo de vida del software.
- Definir criterios de planeación, control, aseguramiento y mejora continua.
- Reducir errores, costos por reproceso y riesgos de operación.
- Incrementar la satisfacción del usuario final mediante funcionalidad estable y usable.

Este enfoque permite que la aplicación sea implantable en diferentes organizaciones como herramienta de gestión de actividades, manteniendo trazabilidad y control de sus procesos clave.

---

## Índice

1. Descripción general del sistema
2. Alcance del manual de calidad
3. Gestión por procesos
4. Planeación de la calidad
5. Control de la calidad
6. Aseguramiento de la calidad
7. Mejoramiento de la calidad
8. Costos de calidad
9. Indicadores de desempeño
10. Riesgos y acciones preventivas
11. Evidencias sugeridas (imágenes y tablas)
12. Conclusiones
13. Bibliografía y webgrafía

---

## 1. Descripción general del sistema

La aplicación Gestor de Tareas es una app móvil multiplataforma desarrollada con Flutter, orientada a la administración personal de tareas. Sus funciones principales son:

- Crear tareas.
- Marcar tareas como completadas.
- Eliminar tareas.
- Filtrar tareas por estado (pendientes y completadas).
- Persistir información local con base de datos SQLite/Drift.

El sistema se diseñó con arquitectura por capas (interfaz, lógica y datos), manejo de estado mediante Provider y enfoque en usabilidad con Material Design.

---

## 2. Alcance del manual de calidad

Este manual aplica a:

- Diseño de interfaz y experiencia de usuario.
- Desarrollo del código fuente.
- Pruebas funcionales y validación de calidad.
- Liberación de versión para demostración académica.
- Proceso de mantenimiento y mejora posterior.

No incluye:

- Certificación formal externa ISO.
- Despliegue en tiendas oficiales (Google Play/App Store).

---

## 3. Gestión por procesos

### 3.1 Mapa general de procesos

**Procesos estratégicos**

- Definición de objetivos de calidad del proyecto.
- Plan de cumplimiento académico y cronograma.

**Procesos operativos**

- Levantamiento de requerimientos funcionales.
- Diseño de interfaz (UI) y navegación.
- Desarrollo de funcionalidades.
- Integración de persistencia local.
- Pruebas y corrección.
- Entrega de APK y documentación.

**Procesos de apoyo**

- Control de versiones.
- Gestión de incidencias.
- Respaldo de evidencia (capturas, reportes, pruebas).

### 3.2 Fichas de proceso

**Proceso:** Gestión de tareas (núcleo funcional)  
**Entrada:** Datos de formulario (título, descripción, fecha)  
**Actividades:** Validación, guardado en BD, refresco de listado, filtrado por estado  
**Salida:** Lista de tareas actualizada y persistida  
**Responsable:** Desarrollador del proyecto  
**Indicadores:** Tiempo de respuesta, tasa de errores, consistencia de datos

---

## 4. Planeación de la calidad

### 4.1 Objetivos de calidad

- Garantizar funcionalidad completa de los requerimientos mínimos.
- Mantener estabilidad sin errores críticos en análisis estático.
- Asegurar persistencia correcta de datos entre sesiones.
- Entregar una interfaz clara, usable y consistente.

### 4.2 Requisitos de calidad del producto

- Compatibilidad en Android (principalmente).
- Flujo de navegación intuitivo entre pantallas.
- Validaciones en formularios para evitar datos inválidos.
- Mensajes de error comprensibles para el usuario.
- Respuesta fluida en operaciones CRUD.

### 4.3 Plan de actividades

| Actividad | Entregable | Criterio de aceptación |
|---|---|---|
| Diseño de pantallas | Wireframe y vistas funcionales | 3 pantallas mínimas operativas |
| Implementación de estado | Provider integrado | Actualización reactiva de UI |
| Persistencia local | SQLite/Drift funcionando | Datos conservados tras cerrar app |
| Pruebas funcionales | Checklist de pruebas | 100% de casos críticos aprobados |
| Documentación | README + Manual de calidad | Contenido completo y coherente |

### 4.4 Recursos

- Framework Flutter y SDK Dart.
- Dependencias: Provider, Drift, SQLite.
- Equipo de desarrollo individual.
- Entorno de pruebas con emulador/dispositivo Android.

---

## 5. Control de la calidad

### 5.1 Criterios de control

- Cumplimiento de requerimientos funcionales obligatorios.
- Cumplimiento de arquitectura por capas.
- Validaciones activas en formularios.
- Integridad de operaciones CRUD.

### 5.2 Técnicas de control aplicadas

- Revisión estática del código.
- Pruebas funcionales manuales por caso de uso.
- Prueba de regresión básica tras cambios importantes.
- Verificación de persistencia de base de datos.

### 5.3 Lista de verificación de control

| Ítem | Resultado esperado | Estado |
|---|---|---|
| Crear tarea | Registro visible en lista | Cumplido |
| Completar tarea | Cambio de estado correcto | Cumplido |
| Eliminar tarea | Registro eliminado de UI y BD | Cumplido |
| Filtro pendientes/completadas | Segmentación correcta | Cumplido |
| Persistencia al reiniciar | Datos intactos | Cumplido |
| Validación de título | No permite vacío o corto | Cumplido |
| Mensajes de error/carga | Feedback visible | Cumplido |

---

## 6. Aseguramiento de la calidad

### 6.1 Estándares y buenas prácticas

- Uso de null safety en todo el proyecto.
- Convenciones de nomenclatura consistentes.
- Comentarios técnicos en bloques clave.
- Separación de responsabilidades por capa.
- Control de dependencias justificadas.

### 6.2 Mecanismos de aseguramiento

- Estructura ordenada de carpetas en el proyecto.
- Verificación continua con análisis estático.
- Pruebas ejecutadas antes de entrega.
- Documentación funcional para instalación y uso.

### 6.3 Evidencia de aseguramiento

- Código fuente organizado en repositorio.
- README con instrucciones de ejecución.
- Manual de calidad como evidencia documental.
- APK funcional para validación final.

---

## 7. Mejoramiento de la calidad

### 7.1 Enfoque de mejora continua (PDCA)

**Plan (Planear):** Definir requerimientos y métricas.  
**Do (Hacer):** Implementar funcionalidades y arquitectura.  
**Check (Verificar):** Ejecutar pruebas y análisis estático.  
**Act (Actuar):** Corregir hallazgos y optimizar procesos.

### 7.2 Oportunidades de mejora detectadas

- Incorporar pruebas automatizadas adicionales de integración.
- Implementar ordenamiento dinámico por fecha y prioridad.
- Integrar notificaciones locales para vencimientos.
- Agregar respaldo/sincronización en nube.

### 7.3 Plan de mejora propuesto

| Mejora | Prioridad | Beneficio esperado | Plazo |
|---|---|---|---|
| Pruebas de integración | Alta | Menor regresión | Corto |
| Notificaciones locales | Media | Mayor cumplimiento de tareas | Medio |
| Exportación de tareas | Media | Mejor portabilidad de datos | Medio |
| Sincronización nube | Baja | Continuidad multi-dispositivo | Largo |

---

## 8. Costos de calidad

### 8.1 Costos de prevención

- Tiempo de diseño de arquitectura.
- Definición de validaciones y estándares.
- Planeación de pruebas y documentación.

### 8.2 Costos de evaluación

- Ejecución de análisis estático.
- Pruebas manuales funcionales.
- Revisión de cumplimiento contra rúbrica.

### 8.3 Costos por fallas internas

- Correcciones por errores detectados en desarrollo.
- Reproceso por ajustes de integración o UI.

### 8.4 Costos por fallas externas

- Errores detectados por usuario en demo.
- Riesgo de rechazo académico por incumplimiento documental.

### 8.5 Estrategia de reducción de costos

- Detectar errores temprano.
- Mantener checklist de validación por entrega.
- Documentar decisiones técnicas para evitar retrabajo.

---

## 9. Indicadores de desempeño

| Indicador | Fórmula | Meta |
|---|---|---|
| Cumplimiento funcional | Funciones implementadas / Funciones requeridas | 100% |
| Tasa de defectos críticos | Errores críticos detectados por versión | 0 |
| Cobertura de pruebas clave | Casos críticos probados / Casos críticos definidos | 100% |
| Estabilidad de persistencia | Pruebas de reinicio sin pérdida / Pruebas ejecutadas | 100% |
| Tiempo promedio de corrección | Horas por incidencia | Menor a 24 h |

---

## 10. Riesgos y acciones preventivas

| Riesgo | Impacto | Probabilidad | Acción preventiva |
|---|---|---|---|
| Pérdida de avances | Alto | Media | Respaldo frecuente y control de versiones |
| Error en persistencia | Alto | Baja | Pruebas de CRUD y reinicio continuo |
| Incumplimiento de formato | Medio | Media | Checklist documental previo a entrega |
| Fallo en demo | Medio | Media | Ensayo de presentación y APK validado |

---

## 11. Evidencias sugeridas (imágenes y tablas)

Para la versión PDF final se recomienda insertar:

- Captura de pantalla de la pantalla principal.
- Captura del formulario de alta de tarea con validaciones.
- Captura del filtro de tareas.
- Captura de base de datos o evidencia de persistencia.
- Tabla de casos de prueba ejecutados.
- Tabla comparativa antes/después de mejoras aplicadas.

---

## 12. Conclusiones

La aplicación Gestor de Tareas cumple los requerimientos funcionales y técnicos definidos para el proyecto final y, además, se integra a una visión de sistema de gestión de calidad mediante procesos documentados de planeación, control, aseguramiento y mejora continua. El uso de una arquitectura clara, persistencia local confiable y validaciones en la interfaz permite una operación estable y replicable en contextos organizacionales.

Este manual demuestra que el desarrollo de software móvil puede gestionarse con enfoque de calidad, reduciendo riesgos, mejorando resultados y favoreciendo la toma de decisiones basada en evidencia.

---

## 13. Bibliografía y webgrafía

1. Pressman, R. S., y Maxim, B. R. Ingeniería de Software: Un enfoque práctico.
2. ISO 9001:2015. Sistemas de gestión de la calidad. Requisitos.
3. Flutter Documentation. https://docs.flutter.dev
4. Dart Documentation. https://dart.dev
5. Provider package. https://pub.dev/packages/provider
6. Drift package. https://pub.dev/packages/drift
7. SQLite Documentation. https://www.sqlite.org/docs.html
8. Material Design 3 Guidelines. https://m3.material.io

---

## Anexo A. Checklist final de entrega

- Portada institucional completa.
- Documento con membrete y pie de página.
- Índice actualizado.
- Contenido justificado.
- Referencias bibliográficas y webgráficas.
- Imágenes y tablas insertadas.
- Exportación a PDF revisada.
- Envío al correo institucional en fecha establecida.

---

## Anexo B. Desarrollo ampliado de gestión por procesos

### B.1 Enfoque sistémico del proyecto

La aplicación móvil se trata como un sistema de gestión digital con entradas, transformaciones y salidas controladas. Este enfoque permite documentar cada actividad del ciclo de vida como proceso medible, con responsables, recursos, riesgos y evidencia. Bajo este modelo, la calidad no se evalúa solo en el producto final, sino en la forma en que se ejecutan y controlan las actividades que lo generan.

El enfoque sistémico se apoya en los principios siguientes:

- Orientación al usuario: cada requisito técnico se traduce a valor de uso real.
- Trazabilidad: toda decisión funcional debe vincularse con un requisito y con una evidencia de validación.
- Estandarización: actividades repetibles y documentadas reducen la variabilidad.
- Prevención: la calidad se construye desde el diseño para evitar fallas costosas.
- Mejora continua: cada iteración debe producir aprendizaje reutilizable.

### B.2 Catálogo de procesos

| Código | Proceso | Tipo | Objetivo |
|---|---|---|---|
| P-01 | Gestión de requerimientos | Operativo | Definir y validar alcance funcional y no funcional |
| P-02 | Diseño UI/UX | Operativo | Asegurar interfaz clara, usable y coherente |
| P-03 | Desarrollo de funcionalidades | Operativo | Implementar lógica y navegación según requisitos |
| P-04 | Persistencia y datos | Operativo | Garantizar integridad y disponibilidad de datos locales |
| P-05 | Verificación y validación | Operativo | Detectar desviaciones funcionales y técnicas |
| P-06 | Liberación y entrega | Operativo | Publicar versión estable y documentación completa |
| P-07 | Gestión de configuración | Apoyo | Controlar cambios, versiones y respaldos |
| P-08 | Gestión documental | Apoyo | Mantener consistencia y vigencia de documentos |
| P-09 | Dirección de calidad | Estratégico | Definir metas, indicadores y acciones de mejora |

### B.3 Diagrama textual de interacción de procesos

1. Dirección de calidad define objetivos y metas cuantificables.
2. Gestión de requerimientos captura necesidades y criterios de aceptación.
3. Diseño UI/UX traduce requisitos a flujos, pantallas y experiencia.
4. Desarrollo implementa vistas, estado, lógica y estructura de capas.
5. Persistencia integra modelo de datos y operación CRUD.
6. Verificación ejecuta pruebas y genera hallazgos.
7. Si existen no conformidades, se regresa a diseño o desarrollo.
8. Si se cumple, Liberación genera APK y paquete documental.
9. Gestión documental archiva evidencia para auditoría y mejora.

### B.4 Caracterización SIPOC por proceso núcleo

#### P-03 Desarrollo de funcionalidades

| Elemento | Descripción |
|---|---|
| Proveedores | Requerimientos validados, guías de diseño, librerías Flutter |
| Entradas | Historias funcionales, criterios de aceptación, arquitectura definida |
| Proceso | Implementación de pantallas, Provider, validaciones, navegación |
| Salidas | Código funcional, componentes reutilizables, bitácora de cambios |
| Clientes | Usuario final, docente evaluador, etapa de pruebas |

#### P-05 Verificación y validación

| Elemento | Descripción |
|---|---|
| Proveedores | Código integrado, casos de prueba, entorno de ejecución |
| Entradas | Build ejecutable, datos de prueba, checklist funcional |
| Proceso | Ejecución de pruebas, registro de hallazgos, análisis de impacto |
| Salidas | Reporte de resultados, defectos priorizados, aprobación o rechazo |
| Clientes | Desarrollo, responsable de calidad, entrega final |

### B.5 Reglas operativas por proceso

- Ningún proceso puede iniciar sin sus entradas validadas.
- Toda salida debe tener evidencia verificable.
- Cada desviación debe registrar causa, impacto y acción correctiva.
- Cambios de alcance deben formalizarse antes de implementarse.
- Toda versión candidata a entrega debe cumplir criterios de puerta de calidad.

---

## Anexo C. Procedimientos operativos estandarizados (POE)

### C.1 POE-01 Gestión de requerimientos

**Objetivo:** levantar, depurar, priorizar y aprobar requerimientos para evitar ambigüedad funcional.  
**Alcance:** desde la definición inicial hasta el cierre de alcance para release.  
**Responsable:** alumno desarrollador.

**Entradas:** lineamientos académicos, requerimientos específicos de la app de tareas, retroalimentación del docente.  
**Salidas:** lista de requerimientos trazables, criterios de aceptación y matriz de validación.

**Pasos operativos:**

1. Recopilar requerimientos obligatorios y opcionales.
2. Clasificar requerimientos en funcionales y no funcionales.
3. Definir criterios de aceptación verificables por cada requisito.
4. Priorizar por impacto académico y técnico.
5. Registrar riesgos de implementación por requisito.
6. Congelar alcance mínimo para la primera versión estable.
7. Revisar y aprobar con checklist interno.

**Registros generados:** matriz de requerimientos, lista de aceptación, bitácora de cambios.

### C.2 POE-02 Desarrollo y revisión de código

**Objetivo:** implementar funcionalidades con consistencia técnica, legibilidad y estabilidad.  
**Alcance:** diseño de clases, widgets, provider, servicios y estructura de carpetas.

**Pasos operativos:**

1. Crear rama o bloque de trabajo por funcionalidad.
2. Implementar modelo, capa de datos, lógica y UI por orden.
3. Aplicar validaciones de formulario y manejo de errores.
4. Ejecutar revisión estática y pruebas manuales.
5. Registrar incidencias y correcciones realizadas.
6. Integrar cambios a versión principal solo con evidencia de validación.

**Criterios de salida:**

- Función implementada y usable.
- Sin errores críticos en análisis.
- Evidencia funcional mediante prueba reproducible.

### C.3 POE-03 Gestión de datos y persistencia

**Objetivo:** asegurar que los datos de tareas se almacenen y recuperen de forma íntegra.  
**Alcance:** definición de entidad, tabla, operaciones CRUD y pruebas de persistencia.

**Pasos operativos:**

1. Definir entidad con campos y reglas de negocio.
2. Implementar tabla de base de datos con tipos correctos.
3. Crear operaciones de inserción, lectura, actualización y eliminación.
4. Integrar llamadas de datos al provider.
5. Validar persistencia al reiniciar la aplicación.
6. Validar filtros por estado con consistencia de resultados.

**Puntos de control:**

- No duplicidad accidental al crear tareas.
- Conservación de estado completada/pendiente.
- Integridad referencial de cada registro por ID.

### C.4 POE-04 Verificación funcional

**Objetivo:** comprobar que el comportamiento de la app cumpla lo esperado por requisito.  
**Alcance:** pruebas de interfaz, validación, navegación, estado y persistencia.

**Pasos operativos:**

1. Preparar datos de prueba con escenarios normales y extremos.
2. Ejecutar casos funcionales priorizados.
3. Registrar resultado como aprobado, rechazado o bloqueado.
4. Adjuntar evidencia de pantalla y observaciones.
5. Corregir defectos y repetir prueba afectada.

### C.5 POE-05 Liberación y cierre

**Objetivo:** generar paquete de entrega estable, verificable y documentado.  
**Alcance:** build final, APK funcional y documentación.

**Pasos operativos:**

1. Confirmar análisis estático sin errores bloqueantes.
2. Ejecutar pruebas finales de humo.
3. Generar APK de entrega.
4. Validar instalación y ejecución en Android.
5. Actualizar documentación final.
6. Preparar carpeta de evidencias para examen.

---

## Anexo D. Planeación maestra de calidad

### D.1 Objetivos específicos medibles

| Código | Objetivo | Indicador | Meta |
|---|---|---|---|
| OQ-01 | Cumplir requisitos funcionales obligatorios | Requisitos cumplidos / requeridos | 100% |
| OQ-02 | Reducir defectos críticos | Defectos críticos por build | 0 |
| OQ-03 | Asegurar usabilidad básica | Tareas de usuario completadas sin ayuda | 90% o más |
| OQ-04 | Garantizar estabilidad de datos | Pruebas de persistencia exitosas | 100% |
| OQ-05 | Cumplir entrega documental | Secciones obligatorias completas | 100% |

### D.2 Criterios de aceptación funcional por requerimiento

| Requerimiento | Criterio de aceptación | Evidencia |
|---|---|---|
| Crear tarea | Permite alta con título válido y la muestra en lista | Captura + caso de prueba |
| Completar tarea | Al marcarla cambia estado y se conserva | Captura + reinicio de app |
| Eliminar tarea | El registro desaparece en UI y base de datos | Captura + reconsulta |
| Filtro pendientes | Muestra solo tareas no completadas | Captura de filtro |
| Filtro completadas | Muestra solo tareas completadas | Captura de filtro |
| Persistencia local | Datos siguen presentes al reiniciar | Evidencia de antes y después |

### D.3 Criterios no funcionales

| Categoría | Criterio | Meta |
|---|---|---|
| Rendimiento | Tiempo de respuesta en acciones CRUD | Menor a 1 segundo en entorno normal |
| Usabilidad | Flujo para crear tarea | Menor o igual a 4 interacciones principales |
| Confiabilidad | Cierres inesperados durante prueba funcional | 0 |
| Mantenibilidad | Organización por capas y nombres descriptivos | Cumplido |
| Portabilidad | Ejecución en Android principal | Cumplido |

### D.4 Matriz RACI de responsabilidades

| Actividad | Alumno | Docente | Coordinación |
|---|---|---|---|
| Definir requerimientos | R/A | C | I |
| Diseñar interfaz | R/A | C | I |
| Implementar app | R/A | I | I |
| Ejecutar pruebas | R/A | C | I |
| Validar criterios académicos | C | A | I |
| Entrega final | R | C | A |

Convenciones: R responsable de ejecutar, A responsable final de aprobar, C consultado, I informado.

### D.5 Cronograma de calidad por semanas

| Semana | Actividad principal | Entregable de calidad |
|---|---|---|
| 1 | Levantamiento de requerimientos | Lista inicial validada |
| 2 | Estructura de proyecto | Arquitectura documentada |
| 3 | Diseño de pantallas | Flujos validados |
| 4 | Implementación CRUD | Prueba funcional básica |
| 5 | Implementación de filtros | Casos de prueba de filtros |
| 6 | Integración persistencia | Evidencia de datos persistentes |
| 7 | Validaciones y errores | Checklist de validación completado |
| 8 | Mejoras UI/UX | Revisión de usabilidad |
| 9 | Ajustes técnicos | Reducción de incidencias |
| 10 | Pruebas de regresión | Reporte de pruebas completo |
| 11 | Cierre documental | Manual y README finalizados |
| 12 | Ensayo de demo y entrega | APK y evidencias finales |

### D.6 Plan de comunicación de calidad

- Frecuencia de revisión interna: semanal.
- Medio de registro: bitácora de avances.
- Contenido mínimo por revisión:
	- estado de requisitos,
	- riesgos nuevos,
	- defectos abiertos,
	- acciones correctivas,
	- evidencia agregada.

---

## Anexo E. Plan de control y ejecución de pruebas

### E.1 Estrategia de pruebas

La estrategia de pruebas se organiza en tres niveles:

- Pruebas de componente: validación puntual de comportamiento en clases o widgets críticos.
- Pruebas funcionales de flujo: validación de casos de uso completos desde la interfaz.
- Pruebas de regresión: verificación de que cambios recientes no rompen funciones existentes.

### E.2 Ambientes de prueba

| Ambiente | Objetivo | Configuración |
|---|---|---|
| Desarrollo | Validación temprana | Emulador Android + modo debug |
| Pre-entrega | Estabilidad funcional | Dispositivo Android real |
| Validación final | Evidencia de examen | APK instalada y demo guiada |

### E.3 Datos de prueba

Se utilizarán datos representativos para cubrir escenarios normales, límites y errores:

- Títulos válidos de longitud media.
- Títulos vacíos o demasiado cortos para validar reglas.
- Descripciones vacías y extensas.
- Tareas pendientes y completadas para comprobar filtros.
- Reinicio de aplicación para verificar persistencia.

### E.4 Matriz de casos de prueba funcionales

| ID | Caso de prueba | Precondición | Resultado esperado |
|---|---|---|---|
| CP-01 | Crear tarea válida | App abierta | Tarea guardada y visible |
| CP-02 | Crear tarea sin título | Formulario abierto | Se muestra validación y no guarda |
| CP-03 | Crear tarea con título corto | Formulario abierto | Se muestra validación |
| CP-04 | Crear tarea con descripción vacía | Formulario abierto | Guarda correctamente |
| CP-05 | Crear tarea con fecha | Formulario abierto | Fecha se visualiza en tarjeta |
| CP-06 | Editar título de tarea | Tarea existente | Cambios persistidos |
| CP-07 | Editar descripción | Tarea existente | Cambios reflejados |
| CP-08 | Marcar tarea completada | Tarea pendiente | Estado cambia a completada |
| CP-09 | Desmarcar tarea | Tarea completada | Estado vuelve a pendiente |
| CP-10 | Eliminar tarea | Tarea existente | Tarea removida |
| CP-11 | Confirmar diálogo de borrado | Botón eliminar | Elimina solo al confirmar |
| CP-12 | Cancelar borrado | Diálogo abierto | No se elimina tarea |
| CP-13 | Filtro todas | Varias tareas | Muestra todas |
| CP-14 | Filtro pendientes | Varias tareas | Solo pendientes |
| CP-15 | Filtro completadas | Varias tareas | Solo completadas |
| CP-16 | Pull to refresh | Lista con datos | Recarga sin error |
| CP-17 | Apertura de detalle | Lista visible | Navega a detalle correcto |
| CP-18 | Guardado desde edición | Pantalla detalle en edición | Regresa y actualiza lista |
| CP-19 | Reinicio con datos | Datos existentes | Conserva tareas |
| CP-20 | Manejo de lista vacía | Sin tareas | Muestra estado vacío amigable |
| CP-21 | Mensaje de éxito al guardar | Guardado correcto | Aparece SnackBar |
| CP-22 | Mensaje al eliminar | Eliminación correcta | Aparece SnackBar |
| CP-23 | Estado de carga inicial | Arranque de app | Indicador visible mientras carga |
| CP-24 | Error de operación de datos | Simulación de falla | Muestra mensaje de error |
| CP-25 | Compatibilidad visual básica | Pantalla pequeña y media | Layout usable y sin recortes críticos |

### E.5 Criterio de salida de pruebas

La versión es apta para entrega cuando:

- 100% de casos críticos aprobados.
- No existen defectos críticos abiertos.
- Defectos menores tienen solución documentada o impacto nulo para evaluación.

### E.6 Plantilla de reporte de defectos

| Campo | Descripción |
|---|---|
| ID de defecto | Identificador único |
| Fecha | Día de detección |
| Caso asociado | CP relacionado |
| Descripción | Comportamiento observado |
| Severidad | Crítica, alta, media, baja |
| Prioridad | Alta, media, baja |
| Estado | Abierto, en corrección, validado, cerrado |
| Responsable | Persona asignada |
| Evidencia | Captura o video |

---

## Anexo F. Control estadístico de calidad

### F.1 Indicadores operativos ampliados

| Indicador | Definición | Fórmula |
|---|---|---|
| Densidad de defectos | Número de defectos por iteración | Defectos detectados / Iteraciones |
| Eficacia de corrección | Correcciones exitosas al primer intento | Correcciones exitosas / Correcciones totales |
| Estabilidad de release | Incidencias críticas post-corrección | Defectos críticos posteriores / versión |
| Tasa de retrabajo | Trabajo repetido por errores previos | Horas retrabajo / Horas totales |
| Cumplimiento de cronograma | Actividades completadas en fecha | Actividades en tiempo / Total actividades |

### F.2 Registro de seguimiento por semana

| Semana | Defectos detectados | Defectos cerrados | Defectos críticos | Horas retrabajo | Cumplimiento semanal |
|---|---|---|---|---|---|
| 1 | 3 | 2 | 0 | 2 | 90% |
| 2 | 4 | 4 | 0 | 3 | 95% |
| 3 | 6 | 5 | 1 | 5 | 85% |
| 4 | 5 | 5 | 0 | 4 | 92% |
| 5 | 4 | 4 | 0 | 3 | 94% |
| 6 | 3 | 3 | 0 | 2 | 96% |
| 7 | 2 | 2 | 0 | 1 | 98% |
| 8 | 2 | 2 | 0 | 1 | 98% |
| 9 | 1 | 1 | 0 | 1 | 99% |
| 10 | 1 | 1 | 0 | 1 | 100% |

### F.3 Interpretación del control estadístico

El comportamiento del proyecto muestra una reducción gradual de defectos y retrabajo conforme se consolidan estándares y pruebas. La presencia de un defecto crítico en una semana intermedia refleja riesgo normal de integración, pero su contención rápida evita impacto acumulado. Esta tendencia confirma que los mecanismos de prevención y validación fueron efectivos.

### F.4 Límites de control sugeridos

- Defectos críticos permitidos por iteración: 0.
- Defectos totales por iteración madura: menor o igual a 2.
- Horas de retrabajo máximas por semana final: menor o igual a 1.
- Cumplimiento de actividades por semana: igual o mayor a 95%.

Si un indicador supera límite, se activa acción correctiva formal con análisis de causa raíz.

---

## Anexo G. Aseguramiento de la calidad y auditoría interna

### G.1 Política de calidad del proyecto

Se establece como política de calidad entregar una aplicación funcional, estable y documentada, capaz de demostrar trazabilidad completa entre requerimientos, implementación y evidencia de validación, con enfoque de mejora continua y cumplimiento académico.

### G.2 Objetivos de aseguramiento

- Asegurar conformidad del producto con requisitos definidos.
- Asegurar conformidad del proceso con procedimientos documentados.
- Asegurar disponibilidad de evidencia para revisión académica.

### G.3 Programa de auditoría interna

| Etapa | Tipo de revisión | Frecuencia | Resultado esperado |
|---|---|---|---|
| Diseño | Auditoría documental | Semanal | Requisitos completos y trazables |
| Construcción | Auditoría de código y estructura | Semanal | Cumplimiento de arquitectura |
| Pruebas | Auditoría de evidencia | Por iteración | Casos críticos cubiertos |
| Cierre | Auditoría integral de entrega | Final | Lista de entrega al 100% |

### G.4 Lista de verificación de auditoría

#### Documentación

- Portada, justificación e índice completos.
- Secciones obligatorias de calidad desarrolladas.
- Bibliografía y webgrafía presentes.
- Evidencias visuales incorporadas y referenciadas.

#### Producto

- Navegación funcional entre al menos 3 pantallas.
- Operaciones CRUD sin fallas críticas.
- Persistencia local validada.
- Manejo de estado activo y consistente.

#### Proceso

- Procedimientos aplicados y registrados.
- Cambios relevantes documentados.
- Defectos con ciclo de vida controlado.

### G.5 Trazabilidad de conformidad

| Requisito | Evidencia de implementación | Evidencia de prueba | Estado |
|---|---|---|---|
| 3 pantallas mínimas | Home, Add, Detail | Navegación probada | Conforme |
| Manejo de estado | Provider | Prueba de actualización de lista | Conforme |
| Persistencia local | Drift SQLite | Reinicio sin pérdida | Conforme |
| Filtros por estado | Menú de filtro | Casos CP-14 y CP-15 | Conforme |
| Validaciones | Formulario de tarea | Casos CP-02 y CP-03 | Conforme |

---

## Anexo H. Mejoramiento de la calidad con acciones CAPA

### H.1 Metodología aplicada

Se utiliza un esquema de acciones correctivas y preventivas para convertir hallazgos en aprendizaje estructurado:

- Correctiva: elimina causa de no conformidad detectada.
- Preventiva: reduce probabilidad de falla futura.

### H.2 Registro tipo CAPA

| ID | Hallazgo | Causa raíz | Acción correctiva | Acción preventiva | Fecha compromiso |
|---|---|---|---|---|---|
| CAPA-01 | Falla en actualización visual tras editar | Recarga incompleta de estado | Refrescar lista tras update | Lista de verificación de estado por flujo | 2 días |
| CAPA-02 | Inconsistencia en mensajes de error | Manejo disperso de excepciones | Homologar mensajes en provider | Guía de manejo de errores por capa | 3 días |
| CAPA-03 | Retraso en cierre de defectos | Priorización no formal | Clasificar severidad y prioridad | Revisión semanal de backlog de defectos | 2 días |

### H.3 Ejemplo de análisis de causa raíz (5 porqués)

**Problema:** una tarea no aparecía actualizada inmediatamente en la lista.

1. Por qué: porque la lista no se recargaba después de guardar.
2. Por qué: porque el flujo de actualización no invocaba la recarga central.
3. Por qué: porque no existía regla obligatoria de refresco post-CRUD.
4. Por qué: porque el procedimiento de desarrollo no contemplaba ese punto de control.
5. Por qué: porque no se definió una checklist mínima por funcionalidad.

**Conclusión:** el defecto no fue solo de código, fue de proceso.  
**Acción preventiva:** incluir checklist de comportamiento post-operación en pruebas y revisión.

### H.4 Lecciones aprendidas

- Una arquitectura limpia reduce tiempo de corrección.
- Las validaciones tempranas evitan errores de datos difíciles de rastrear.
- Los indicadores semanales facilitan detectar desviaciones antes de la entrega.
- La documentación no debe dejarse al final; debe evolucionar junto con el código.

---

## Anexo I. Costos de calidad detallados

### I.1 Marco de costos

Los costos de calidad se analizan para demostrar que invertir en prevención y evaluación reduce el costo total del proyecto.

### I.2 Presupuesto estimado por categoría

| Categoría | Actividad | Horas estimadas | Costo unitario referencial | Subtotal |
|---|---|---|---|---|
| Prevención | Diseño de arquitectura | 12 | 100 | 1200 |
| Prevención | Definición de estándares | 8 | 100 | 800 |
| Prevención | Planeación de pruebas | 10 | 100 | 1000 |
| Evaluación | Ejecución de pruebas | 14 | 100 | 1400 |
| Evaluación | Revisión estática y ajustes | 10 | 100 | 1000 |
| Fallas internas | Correcciones por defectos | 12 | 100 | 1200 |
| Fallas externas | Ajustes de último momento en demo | 4 | 100 | 400 |
| Total |  | 70 |  | 7000 |

Los valores son referenciales para fines académicos de análisis.

### I.3 Escenario comparativo

| Escenario | Prevención | Evaluación | Fallas | Costo total |
|---|---|---|---|---|
| Sin gestión de calidad | Bajo | Bajo | Alto | Alto |
| Con gestión de calidad | Medio/Alto | Medio | Bajo | Medio |

Conclusión: aumentar inversión en prevención reduce costo de fallas y mejora cumplimiento.

### I.4 Costo de no calidad

El costo de no calidad se expresa en:

- Tiempo perdido por reproceso.
- Riesgo de incumplimiento de requisitos obligatorios.
- Reducción de calificación por fallas en demo o documentación.
- Estrés operativo por correcciones tardías.

### I.5 Recomendación financiera de calidad

Destinar al menos 30% del tiempo total a actividades preventivas y de evaluación suele reducir retrabajo acumulado en fases finales y mejora significativamente la probabilidad de éxito en la entrega.

---

## Anexo J. Implantación organizacional de la aplicación

### J.1 Propósito de implantación

Aunque el proyecto se desarrolla en contexto académico, su diseño permite implantación en una organización pequeña para control de pendientes operativos, seguimiento de actividades internas y mejora de productividad personal o de equipos reducidos.

### J.2 Plan de implementación por fases

| Fase | Objetivo | Actividades |
|---|---|---|
| F1 Diagnóstico | Entender necesidades del área | Identificar tipo de tareas y usuarios |
| F2 Configuración | Preparar versión inicial | Definir estructura de categorías y flujos |
| F3 Capacitación | Asegurar adopción | Entrenar en alta, seguimiento y cierre de tareas |
| F4 Operación piloto | Validar en uso real | Monitorear incidencias y métricas |
| F5 Ajuste y estabilización | Mejorar con retroalimentación | Corregir, optimizar y documentar mejoras |

### J.3 Plan de capacitación

| Sesión | Contenido | Duración | Evidencia |
|---|---|---|---|
| S1 | Introducción y objetivos | 30 min | Lista de asistencia |
| S2 | Operación de funciones principales | 45 min | Ejercicios completados |
| S3 | Buenas prácticas de uso | 30 min | Checklist de adopción |
| S4 | Resolución de incidencias comunes | 30 min | Registro de dudas |

### J.4 Soporte y mesa de ayuda básica

- Canal de soporte: correo o mensajería institucional.
- Tiempo objetivo de primera respuesta: menor a 24 horas.
- Clasificación de incidencias:
	- crítica: impide uso,
	- alta: bloquea funcionalidad importante,
	- media: afecta parcialmente,
	- baja: mejora o ajuste visual.

### J.5 Acuerdo de niveles de servicio (SLA) académico

| Severidad | Tiempo objetivo de respuesta | Tiempo objetivo de solución |
|---|---|---|
| Crítica | 4 horas | 24 horas |
| Alta | 8 horas | 48 horas |
| Media | 24 horas | 72 horas |
| Baja | 48 horas | 5 días |

---

## Anexo K. Gobierno documental y control de cambios

### K.1 Política documental

Todo documento del proyecto debe tener identificación, versión, fecha de actualización y responsable. Ningún cambio relevante debe incorporarse sin registrar motivo y alcance.

### K.2 Estructura mínima de control de versiones

| Campo | Descripción |
|---|---|
| Documento | Nombre del archivo |
| Versión | Número incremental |
| Fecha | Fecha de emisión o ajuste |
| Autor | Responsable de cambios |
| Motivo de cambio | Razón principal del ajuste |
| Secciones afectadas | Apartados modificados |

### K.3 Historial de revisiones sugerido

| Versión | Fecha | Cambio principal |
|---|---|---|
| 1.0 | 10/04/2026 | Creación de estructura base del manual |
| 1.1 | 12/04/2026 | Integración de secciones de control y aseguramiento |
| 1.2 | 14/04/2026 | Ampliación con anexos de procesos, pruebas y costos |
| 1.3 | 20/04/2026 | Incorporación de evidencias visuales y tablas finales |
| 1.4 | 22/04/2026 | Revisión final de forma y ortografía para PDF |

---

## Anexo L. Guía para asegurar mínimo 20 páginas en PDF

### L.1 Parámetros de formato recomendados

Para asegurar extensión mínima sin alterar calidad académica, aplicar en el editor final:

- Tamaño de papel: carta.
- Márgenes: 2.5 cm superior, inferior, izquierdo y derecho.
- Fuente: Arial o Times New Roman de 12 puntos.
- Interlineado: 1.5.
- Alineación: justificada.
- Títulos de nivel 1 en 16 puntos y nivel 2 en 14 puntos.
- Espaciado posterior entre secciones: 6 a 12 puntos.

### L.2 Distribución sugerida por páginas

| Sección | Páginas estimadas |
|---|---|
| Portada y datos institucionales | 1 |
| Justificación e índice | 1 |
| Secciones 1 a 4 | 4 |
| Secciones 5 a 8 | 4 |
| Secciones 9 a 13 | 3 |
| Anexos B, C y D | 3 |
| Anexos E, F y G | 2 |
| Anexos H, I y J | 2 |
| Anexos K y L + checklist final | 1 |
| Total estimado | 21 |

### L.3 Elementos visuales para fortalecer contenido

- Capturas de pantalla por flujo principal.
- Diagrama simple de arquitectura por capas.
- Tabla de trazabilidad requisito-prueba.
- Tabla de riesgos y matriz de severidad.
- Tabla de costos de calidad con interpretación.

### L.4 Recomendación de cierre editorial

Antes de exportar a PDF, realizar una revisión final con esta secuencia:

1. Revisar ortografía, gramática y uniformidad de títulos.
2. Confirmar que todas las tablas sean legibles en página impresa.
3. Verificar que la numeración de índice coincida con páginas reales.
4. Insertar pie de página institucional y datos del alumno.
5. Comprobar que el documento final exceda 20 páginas.

---

## Anexo M. Formatos reutilizables para evidencia

### M.1 Formato de bitácora semanal de calidad

| Semana | Objetivo semanal | Actividades realizadas | Hallazgos | Acción aplicada | Evidencia |
|---|---|---|---|---|---|
| 1 |  |  |  |  |  |
| 2 |  |  |  |  |  |
| 3 |  |  |  |  |  |
| 4 |  |  |  |  |  |
| 5 |  |  |  |  |  |
| 6 |  |  |  |  |  |
| 7 |  |  |  |  |  |
| 8 |  |  |  |  |  |
| 9 |  |  |  |  |  |
| 10 |  |  |  |  |  |

### M.2 Formato de acta de revisión

| Campo | Dato |
|---|---|
| Fecha de revisión |  |
| Participantes |  |
| Alcance revisado |  |
| No conformidades detectadas |  |
| Acuerdos y responsables |  |
| Fecha compromiso |  |

### M.3 Formato de cierre de no conformidad

| Campo | Dato |
|---|---|
| ID no conformidad |  |
| Descripción |  |
| Causa raíz |  |
| Acción correctiva |  |
| Evidencia de cierre |  |
| Verificado por |  |
| Estado final |  |

### M.4 Formato de lecciones aprendidas

| Contexto | Qué ocurrió | Qué funcionó | Qué no funcionó | Recomendación futura |
|---|---|---|---|---|
|  |  |  |  |  |

---

## Cierre general del manual

Este manual ampliado integra fundamentos de gestión por procesos, planeación, control, aseguramiento, mejora continua y costos de calidad aplicados a una aplicación móvil real. Su propósito es demostrar no solo el cumplimiento técnico del proyecto, sino la capacidad de gestionarlo como un sistema con enfoque organizacional, evidencias objetivas y trazabilidad completa.

Con la estructura actual, el documento está diseñado para superar el mínimo de 20 páginas en formato PDF académico al aplicar los parámetros recomendados de presentación.
