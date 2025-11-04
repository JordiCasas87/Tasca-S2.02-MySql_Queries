  
  -- QUERYS BASE DE DATOS UNIVERSIDAD (20 Querys)
  -- ================================
  
-- 1 Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. 
	-- El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
   SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE persona.tipo = "alumno" ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

-- 2 Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
   SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE persona.telefono IS NULL;

-- 3 Retorna el llistat dels alumnes que van néixer en 1999.
   SELECT * FROM persona WHERE EXTRACT(YEAR FROM persona.fecha_nacimiento) = '1999';

-- 4 Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
   SELECT persona.nombre, persona.apellido1 FROM persona WHERE persona.tipo = 'profesor'AND persona.telefono IS NULL AND persona.nif LIKE '%K';

-- 5 Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
   SELECT asignatura.nombre FROM universidad.asignatura WHERE asignatura.cuatrimestre = 1 AND asignatura.curso = 3 AND asignatura.id_grado = 7;

-- 6 Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats.
	-- El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. 
    -- El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
   SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS Departamento FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

-- 7 Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
   SELECT asignatura.nombre, asignatura.curso, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE persona.nif = '26902806M';

-- 8 Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura 
	-- en el Grau en Enginyeria Informàtica (Pla 2015).
   SELECT DISTINCT grado.nombre, departamento.nombre from grado JOIN asignatura ON asignatura.id_grado = grado.id JOIN profesor ON profesor.id_profesor = asignatura.id_profesor JOIN departamento ON departamento.id = profesor.id_departamento WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 9 Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
   SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2 FROM persona JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE persona.tipo = 'alumno' AND curso_escolar.anyo_inicio = '2018' AND curso_escolar.anyo_fin = '2019';


-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
-- ================================================================================

-- 1 Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. 
	-- El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat.
    -- El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. 
    -- El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
   SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS Departamento FROM profesor LEFT JOIN departamento ON departamento.id = profesor.id_departamento JOIN persona ON persona.id = profesor.id_profesor WHERE persona.tipo = 'profesor' ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
    
-- 2 Retorna un llistat amb els professors/es que no estan associats a un departament.
   SELECT persona.apellido1, persona.apellido2, persona.nombre FROM profesor LEFT JOIN departamento ON departamento.id = profesor.id_departamento JOIN persona ON persona.id = profesor.id_profesor WHERE persona.tipo = 'profesor' AND profesor.id_departamento IS NULL;

-- 3 Retorna un llistat amb els departaments que no tenen professors/es associats.
   SELECT departamento.nombre AS Departamento, profesor.id_profesor FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id WHERE profesor.id_profesor IS NULL;

-- 4 Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
   SELECT profesor.id_profesor, asignatura.nombre AS Asignatura FROM asignatura RIGHT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.nombre IS NULL;

-- 5 Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
   SELECT  asignatura.nombre , profesor.id_profesor FROM asignatura LEFT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor WHERE profesor.id_profesor IS NULL ;

-- 6 Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
   SELECT DISTINCT departamento.nombre AS Departamento FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id IS NULL;

-- Consultes resum:
-- ================

-- 1 Retorna el nombre total d'alumnes que hi ha.
   SELECT COUNT(*) FROM persona where persona.tipo = 'alumno';

-- 2 Calcula quants alumnes van néixer en 1999.
   SELECT COUNT(*) FROM persona where persona.tipo = 'alumno' AND YEAR (fecha_nacimiento) = 1999 ;

-- 3 Calcula quants professors/es hi ha en cada departament. 
	-- El resultat només ha de mostrar dues columnes, una amb el nom del departament
    -- i una altra amb el nombre de professors/es que hi ha en aquest departament. 
    -- El resultat només ha d'incloure els departaments que tenen professors/es associats 
    -- i haurà d'estar ordenat de major a menor pel nombre de professors/es.
   SELECT departamento.nombre AS Departamento, COUNT(profesor.id_profesor) AS Numero_Profesores FROM departamento JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY Numero_Profesores DESC;

-- 4 Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells.
	-- Tingui en compte que poden existir departaments que no tenen professors/es associats.
    -- Aquests departaments també han d'aparèixer en el llistat.
    SELECT departamento.nombre AS Departamento, COUNT(profesor.id_profesor) AS Numero_Profesores FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY departamento.nombre;
    
-- 5 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. 
	-- Tingues en compte que poden existir graus que no tenen assignatures associades. 
    -- Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
  SELECT grado.nombre AS Grado, COUNT(asignatura.id) AS Numero_Asignaturas FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY Numero_Asignaturas DESC;