# PRUEBA BIBLIOTECA

## Habilidades a evaluar
-  Elaborar un modelo de Entidad-Relación identificando entidades, identificadores y
relaciones entre entidades para representar un problema.
-  Elaborar un modelo relacional utilizando reglas de transformación y de normalización
(3FN) de acuerdo a un modelo entidad relación para representar un problema

## Restricciones
- Se registra una única dirección y teléfono para cada socio.
- El ISBN (International Standard Book Number), es un número de 13 cifras que
identifica de una manera única a cada libro o producto de editorial publicado.
- Para este ejercicio, asumirá que la biblioteca posee un ejemplar de cada libro.
- El número único del autor es un correlativo interno que maneja la biblioteca para
identificarlos y facilitar la búsqueda.
- Un libro tiene al menos un autor principal, puede tener además registrado un coautor.
- Un socio sólo puede pedir un libro a la vez.

## Parte 1 - Creación del modelo conceptual, lógico y físico
1. Realizar el modelo conceptual, considerando las entidades y relaciones entre ellas.

![image](https://user-images.githubusercontent.com/98556305/166124181-b2949e4c-1e0e-4a09-bc58-8a37da55efa8.png)

2. Realizar el modelo lógico, considerando todas las entidades y las relaciones entre ellas, los atributos, normalización y creación de tablas intermedias de ser necesario.

![image](https://user-images.githubusercontent.com/98556305/166124208-375ce15c-861b-48f2-a420-d41b6cff0859.png)

3. Realizar el modelo físico, considerando la especificación de tablas y columnas, además de las claves externas.

![image](https://user-images.githubusercontent.com/98556305/166124222-3f066e48-c084-4cea-a5d9-2556756d745e.png)

## Parte 2 - Creando el modelo en la base de datos
1. Crear el modelo en una base de datos llamada biblioteca, considerando las tablas
definidas y sus atributos.

2. Se deben insertar los registros en las tablas correspondientes.

3. Realizar las siguientes consultas:
- Mostrar todos los libros que posean menos de 300 páginas.

![image](https://user-images.githubusercontent.com/98556305/166124277-c78a862c-e478-4be0-8833-2c180ab57283.png)

-  Mostrar todos los autores que hayan nacido después del 01-01-1970.

![image](https://user-images.githubusercontent.com/98556305/166124296-38ca9f46-7706-4087-8498-7252f5f1be17.png)

- ¿Cuál es el libro más solicitado? 

![image](https://user-images.githubusercontent.com/98556305/166124309-011c5b04-9273-4bc0-87bd-28c31fe561b7.png)

- Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días.

![image](https://user-images.githubusercontent.com/98556305/166124326-da70da00-160c-4a66-8ee5-11e53cc95228.png)
