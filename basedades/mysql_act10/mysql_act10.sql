
USE ENTBANC;

#8
SELECT COUNT(*) AS QuantitatEmpleats
FROM EMPLEAT;

#9
SELECT codCiu, COUNT(codEmp) 
FROM EMPLEAT
GROUP BY codCiu;

#10
SELECT CIUTAT.nom, COUNT(codEmp) AS quantitat
FROM CIUTAT
LEFT JOIN EMPLEAT ON CIUTAT.codCiu = EMPLEAT.codCiu
GROUP BY CIUTAT.nom 
ORDER BY quantitat ASC;

#11
SELECT CIUTAT.nom, COUNT(EMPLEAT.codEmp) AS QuantitatEmpleatsCiutat
FROM CIUTAT
LEFT JOIN EMPLEAT ON CIUTAT.codCiu = EMPLEAT.codCiu
GROUP BY CIUTAT.nom
HAVING COUNT(EMPLEAT.codEmp) > 2;

#12
SELECT EMPLEAT.nom, EMPLEAT.cognoms, HISTORIAL.codCiu, HISTORIAL.nomAg, HISTORIAL.dataFi
FROM EMPLEAT
JOIN HISTORIAL ON EMPLEAT.codEmp = HISTORIAL.codEmp
WHERE HISTORIAL.dataFi IS NULL
ORDER BY EMPLEAT.nom ASC;

#13
SELECT EMPLEAT.nom, EMPLEAT.cognoms, CIUTAT.nom, HISTORIAL.nomAg
FROM EMPLEAT
JOIN HISTORIAL ON EMPLEAT.codEmp = HISTORIAL.codEmp
JOIN CIUTAT ON HISTORIAL.codCiu = CIUTAT.codCiu
WHERE HISTORIAL.dataFi IS NULL
ORDER BY EMPLEAT.nom ASC;

#14
SELECT TITOL.nom, ROUND(AVG(TITULACIONS.nota)) AS notamitjana
FROM TITOL
JOIN TITULACIONS ON TITOL.codTit = TITULACIONS.codTit
GROUP BY TITOL.codTit, TITOL.nom
ORDER BY TITOL.nom ASC;

#15
SELECT EMPLEAT.nom, EMPLEAT.cognoms, TITULACIONS.nota
FROM EMPLEAT
JOIN TITULACIONS ON EMPLEAT.codEmp = TITULACIONS.codEmp
WHERE TITULACIONS.codTit = 1
ORDER BY TITULACIONS.nota DESC
LIMIT 1;

#16
SELECT EMPLEAT.nom, EMPLEAT.cognoms
FROM EMPLEAT
JOIN TITULACIONS ON EMPLEAT.codEmp = TITULACIONS.codEmp
JOIN TITOL ON TITULACIONS.codTit = TITOL.codTit
WHERE TITOL.nom = 'Llicenciat en Empresarials'
ORDER BY TITULACIONS.nota DESC
LIMIT 1;

#17
SELECT HISTORIAL.codEmp, EMPLEAT.nom, EMPLEAT.cognoms, HISTORIAL.codCiu, HISTORIAL.nomAg 
FROM EMPLEAT 
JOIN HISTORIAL ON EMPLEAT.codEmp = HISTORIAL.codEmp
ORDER BY EMPLEAT.codEmp ASC;

#18
SELECT HISTORIAL.codEmp, EMPLEAT.nom, EMPLEAT.cognoms, HISTORIAL.codCiu, HISTORIAL.nomAg 
FROM EMPLEAT 
LEFT JOIN HISTORIAL ON EMPLEAT.codEmp = HISTORIAL.codEmp;

#19
SELECT EMPLEAT.nom, EMPLEAT.cognoms, TITOL.nom AS Titulacio
FROM EMPLEAT
LEFT JOIN TITULACIONS ON EMPLEAT.codEmp = TITULACIONS.codEmp
LEFT JOIN TITOL ON TITULACIONS.codTit = TITOL.codTit;

#20
SELECT EMPLEAT.codEmp, EMPLEAT.nom, EMPLEAT.cognoms, GROUP_CONCAT(TITOL.nom ORDER BY TITULACIONS.nota DESC) AS titulacio
FROM EMPLEAT
LEFT JOIN TITULACIONS ON EMPLEAT.codEmp = TITULACIONS.codEmp
LEFT JOIN TITOL ON TITULACIONS.codTit = TITOL.codTit OR TITOL.codTit IS NULL
GROUP BY EMPLEAT.codEmp, EMPLEAT.nom, EMPLEAT.cognoms;

#21
SELECT CIUTAT.nom 
FROM CIUTAT
LEFT JOIN EMPLEAT ON CIUTAT.codCiu = EMPLEAT.codCiu
LEFT JOIN AGENCIA ON CIUTAT.codCiu = EMPLEAT.codCiu
GROUP BY CIUTAT.nom
ORDER BY CIUTAT.nom ASC;

#22
SELECT DISTINCT CIUTAT.nom
FROM CIUTAT
LEFT JOIN EMPLEAT ON CIUTAT.codCiu = EMPLEAT.codCiu
LEFT JOIN AGENCIA ON CIUTAT.codCiu = AGENCIA.codCiu
WHERE EMPLEAT.codCiu IS NOT NULL AND AGENCIA.codCiu IS NULL;

#23
SELECT DISTINCT CIUTAT.nom
FROM CIUTAT
LEFT JOIN EMPLEAT ON CIUTAT.codCiu = EMPLEAT.codCiu
LEFT JOIN AGENCIA ON CIUTAT.codCiu = AGENCIA.codCiu
WHERE EMPLEAT.codCiu IS NULL AND AGENCIA.codCiu IS NOT NULL;

#24
SELECT DISTINCT CIUTAT.nom
FROM CIUTAT
JOIN EMPLEAT ON CIUTAT.codCiu = EMPLEAT.codCiu
JOIN AGENCIA ON CIUTAT.codCiu = AGENCIA.codCiu;

#25
SELECT EMPLEAT.codEmp, EMPLEAT.dni, EMPLEAT.nom, EMPLEAT.cognoms 
FROM EMPLEAT 
LEFT JOIN TITULACIONS ON EMPLEAT.codEmp = TITULACIONS.codEmp
WHERE TITULACIONS.codEmp IS NULL
GROUP BY EMPLEAT.codEmp, EMPLEAT.dni, EMPLEAT.nom, EMPLEAT.cognoms;

#26
SELECT EMPLEAT.codEmp, EMPLEAT.dni, EMPLEAT.nom, EMPLEAT.cognoms 
FROM EMPLEAT 
LEFT JOIN TITULACIONS ON EMPLEAT.codEmp = TITULACIONS.codEmp
WHERE TITULACIONS.codEmp 
GROUP BY EMPLEAT.codEmp, EMPLEAT.dni, EMPLEAT.nom, EMPLEAT.cognoms;

#27
SELECT EMPLEAT.codEmp, EMPLEAT.nom, EMPLEAT.cognoms, TITOL.nom 
FROM EMPLEAT
JOIN TITULACIONS ON EMPLEAT.codEmp = TITULACIONS.codEmp
JOIN TITOL ON TITULACIONS.codTit = TITOL.codTit
ORDER BY EMPLEAT.codEmp ASC;

