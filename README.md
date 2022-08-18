# Documentación APP Taller de Seguridad 
## Por Agustin Maciel (agustinmaciel0810@gmail.com) - CTC ROSARIO
### Introducción
El presente documento tiene como propósito describir y plasmar el trabajo realizado en el proyecto durante el cursado del taller. <br>
La aplicación surge de los requerimientos exigidos por una letra proporcionada por el docente con el fin de poner en práctica algunos de los puntos aprendidos durante el mes de dictado.
<br> Algunos de ellos son:

* <b>Validaciones FRONT END y BACK END:</b>
  - Validaciones de campos ingresados, para tener información completa y detallada.
  - Validaciones con regexp para permitir determinados tipos de caracteres (ej: números).
  - Carácteres especiales eliminados en el backend para evitar SQL INJECTIONS.
  - Contraseñas robustas requeridas a la hora de registrar un usuario.
* <b>Manejo de sesiones:</b>
  - Uso de sesiones dinámicas para no permitir el robo de cookies.
  - Administración de permisos y sesiones para garantizar acceso solo a los usuarios loggeados en el sistema.
* <b>Hasheo y encriptado de información confidencial o crítica:</b>
  - Uso de bcrypt (función de hashing) para realizar salts y hashes de la información.
* <b>Límite de inserciones para no permitir la fuerza bruta:</b>
  - Utilizado en el login de usuario para evitar ataques automatizados con contraseñas aleatorias.
  - Uso de mariadb para almacenar la cantidad de intentos en la tabla 'login_attempts' y controlar a partir de sus valores.

### Pendientes
A partir de los requerimientos dados por letra, se establecieron ciertas prioridades con el objetivo de abarcar la mayoría de puntos que se vieron durante el curso, las secciones funcionales en la aplicación son:

* <b>Login de usuario</b>
* <b>Registro de usuario</b>
* <b>Ingreso de promociones</b>

Por otro lado, la función de realizar compra quedó desarrollandose y no fue entregada en el presente repositorio.

### Análisis de seguridad
Para fortalecer el aprendizaje de la materia, en el sistema presentado se realizaron distintas pruebas que garantizaran la seguridad que se deseaba al comienzo del desarrollo.
<br> Los resultados se muestran a continuación:

#### Pruebas con burpsuite
  * Fuerza bruta (intruder): Esta prueba se realiza para intentar ingresar al sistema utilizando passwords distintas con un mismo usuario. El sistema no lo permite como
  se mencionaba anteriormente, permite un máximo de 6 intentos, luego se bloquea.<br>
  En este ejemplo el sistema no permite entrar con la contraseña 'Admin1234Admin' que es la correcta, porque ya existen más de 6 intentos el dia de hoy.
  
