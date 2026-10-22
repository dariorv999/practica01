# practica01
practica q3 desarrollo web y patrones

## Como ejecutarla
1. Abrir sql/practica.sql en MySQL Workbench y ejecutarlo por completo. Esto crea la base de datos practica con todos los aspectos indicados.
2. Abrir el proyecto en NetBeans y ejecutarlo.
3. Entrar a http://localhost:91/

## Configuración
- Puerto: 91
- Base de datos: practica en localhost:3306, con el usuario usuario_practica
- Logs en nivel TRACE, con el formato dd HH:mm

## Estructura
- domain: entidad Suculenta
- repository: SuculentaRepository
- service: SuculentaService
- controller: SuculentaController
- templates/general/fragmentos.html: head, encabezado con menu, pie, mensajes y modal de eliminar
- templates/suculenta: listado y formulario de suculentas
- sql/practica.sql: script de la base de datos y datos de prueba