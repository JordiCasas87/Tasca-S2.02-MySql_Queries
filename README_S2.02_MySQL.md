# 📘 Tasca S2.02. Consultas MySQL

## 🧩 Descripción

Este repositorio contiene los ejercicios correspondientes a la **Tasca S2.02 – Consultas MySQL** del **Sprint 2** de la especialización en **Java** de la **IT Academy**.  

El objetivo de esta práctica es **dominar la escritura de consultas SQL** sobre bases de datos relacionales utilizando **MySQL** y **MySQL Workbench**, trabajando con operaciones básicas, filtros, ordenaciones, funciones de agregación, uniones (`JOIN`), y consultas resumen (`GROUP BY`, `HAVING`).

---

## 📄 Bases de datos utilizadas

### 🏪 Base de datos: Tienda

Se trabaja con las siguientes tablas:

- **producto** (`codigo`, `nombre`, `precio`, `codigo_fabricante`)
- **fabricante** (`codigo`, `nombre`)

La relación entre ambas es:
> `producto.codigo_fabricante` → `fabricante.codigo`

#### Consultas realizadas
Incluyen ejercicios como:
- Listar productos, precios y fabricantes.  
- Conversión de precios a otras monedas y uso de alias.  
- Uso de funciones de texto (`UPPER`, `LOWER`, `SUBSTRING`) y funciones numéricas (`ROUND`, `TRUNCATE`).  
- Eliminación de duplicados con `DISTINCT`.  
- Ordenaciones (`ORDER BY`), límites (`LIMIT` y `OFFSET`) y filtros (`WHERE`, `BETWEEN`, `LIKE`, `IN`).  
- Subconsultas y comparaciones entre productos de distintos fabricantes.  
- Consultas con `JOIN` y sin `JOIN` (utilizando subconsultas).  
- Obtención del producto más caro y el más barato.  
- Comparación de precios entre fabricantes.  
- Listados de productos según condiciones específicas de fabricante o precio.

---

### 🎓 Base de datos: Universidad

Basada en el archivo `schema_universidad.sql`.  
Incluye tablas como **alumno**, **profesor**, **departamento**, **asignatura**, **grado**, **curso_escolar**, y otras entidades relacionadas.

#### Consultas realizadas
Se abordan temas como:
- Listados de alumnos y profesores con filtros, ordenaciones y condiciones.  
- Búsqueda de alumnos nacidos en un año concreto.  
- Profesores cuyo NIF termina en una letra determinada.  
- Asignaturas por curso, cuatrimestre o grado.  
- Consultas con múltiples `JOIN` para mostrar relaciones entre profesores, departamentos y asignaturas.  
- Consultas con `LEFT JOIN` y `RIGHT JOIN` para incluir registros sin coincidencia.  
- Identificación de profesores sin departamento, asignaturas sin profesor o departamentos sin actividad docente.  
- Consultas resumen con `COUNT`, `SUM` y `GROUP BY`.  
- Filtrado de resultados agregados mediante `HAVING`.

---

## 📊 Consultas resumen destacadas

- Número total de alumnos.  
- Alumnos nacidos en 1999.  
- Número de profesores por departamento (solo los que tienen).  
- Todos los departamentos con su número de profesores (incluyendo los que no tienen).  
- Grados con su número de asignaturas (incluyendo los que no tienen).  
- Grados con más de 40 asignaturas.  
- Suma total de créditos por tipo de asignatura y por grado.  
- Número de alumnos matriculados por curso escolar.  
- Número de asignaturas impartidas por cada profesor (incluyendo los que no imparten).  
- Datos del alumno más joven.  
- Profesores con departamento asignado que no imparten asignaturas.

---

## 🧱 Niveles de compleción

| Nivel | Requisito | Detalle |
|--------|------------|----------|
| **Nivel 1** | 37 consultas correctas | Al menos **20** deben ser del diagrama **Universidad** |
| **Nivel 2** | Entre 37 y 56 consultas correctas | Al menos **20** del diagrama **Universidad** |
| **Nivel 3** | Más de 56 consultas correctas | Al menos **20** del diagrama **Universidad** |

---

## 💻 Tecnologías utilizadas

- **MySQL 8.x**
- **MySQL Workbench**
- **Git & GitHub**

---

## 📚 Contenido del repositorio

El repositorio incluye:
- Archivo `.sql` con todas las consultas de las bases de datos **Tienda** y **Universidad**.  
- Diagramas EER (`.png`) para comprender las relaciones entre tablas.  
- Datos de ejemplo para realizar pruebas y validaciones.

---

## 🛠️ Instalación

Clona el repositorio

Abre el archivo `.sql` en **MySQL Workbench** y ejecuta las consultas en orden para comprobar los resultados.

---

## ▶️ Ejecución

1. Abre **MySQL Workbench**.  
2. Carga la base de datos `tienda` o `universidad` según el bloque de consultas.  
3. Ejecuta cada sentencia SQL y analiza los resultados.  
4. Usa `EXPLAIN` y el diagrama E-R para comprender las relaciones entre tablas.  

---

## 🤝 Autoría

Proyecto desarrollado por **Jordi**  
como parte del itinerario de especialización en **Java – IT Academy**.
