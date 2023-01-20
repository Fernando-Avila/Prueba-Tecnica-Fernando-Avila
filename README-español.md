# Prueba tecnica Fernando Avila

_Esta es mi prueba de Flutter, para conocer y armar un Crud de tareas y acceder a permisos del celular_

## Comenzando 🚀

_Se desarrolló un proyecto enfocado en elregistro, modificacion y eliminacion de tareas._
_El proyecto consta del consumo RealTime de Cloud Firestore, en donde se agrega ingresan colecciones con nuestro modelo y con el se baso el proyecto._


### Pre-requisitos 📋

_El proyecto esta desarrollado en Flutter 3.3.10 la ultima versíon y tiene conexion con mi ifrebase Personal._
_La base de datos de Genero mediante Firebase con el modelo de colecciones y FireStore para almacenar las fotos_
_No se necesita mas que correr el proyecto Flutter para tener acceso al aplicativo_
_Se recomienda actualizar librerias en caso de no tenerlas para correr la ultima version de Flutter_
```

```

## Proyecto⚙️
_El proyecto cuenta de un Login con un correo y clave unico de acceso registrados en Firebase Authentication_
_Correo: testtodo@icreativa.com.ec_
_Clave: testtodo_
_Al ingresar se encuentra con un listado de Tareas en vertical, son Widgets Dismisibles en donde al deslizar a la izquierda se eliminara la tarea_
_Y al Deslizar a la derecha se completará la tarea_
_En la Parte superior Derecha se encuentra un IconButton Que le redigirá a su formulario para ingresar tareas_
_Al finalizar el formulario con el boton se registrara y a estar conectado en RealTime la vista anterior recargara sus tareas_
_Las imagenes se cargaran al almacenamiento de Firebase Storage_

### Paquetes 

_Se utilizaron paquetes verificados de Pub.Dev para las diferentes actividades, los paquetes de Firebasse que nos ayudan con la conexion A Firebas_
_En donde se incluye la base de datos, consumo de servicios y demas_
_Provider: Se utilizó Provider como gestor de estados para mantener la secion de Usuario activá_
_image_picker: Un paquete que nos brinda la facilidad de obtener fotos desde la camara o nuestra galería, las cuales se cargan en memoria temporal y se pueden utilizar en la app_
_location: Paquete que nos ayuda a activar y leer srvicios GPS en el dispositivo, nos ayuda a pedir permisos y activar directamenteel GPS para obtener las cordenadas de ubicacion_
_cached_network_image: Lo utilizamos para cargar imagenes desde internet y que se guarden en cache, se utilzia para ver las imagenes de las tareas_
_flutter_keyboard_visibility: Pquete que detecta si se abre el teclado en la aplicacio, se utiliza para lanzar eventos en al abrir el teclado_
_flutter_launcher_icons: Nos facilita el ambio de icono de launch de la aplicacion_

### metodología
_Se trabajó con El Modelo MVC manejando vistas, controladores y los respectivos modelos_
_Se manejaron Widgets y layouts para el diseño, todo ubicado en el directorio lib/ui_
__Los controladores en el directorio lib/Controlers_
__Los modelos en el directorio lib/Models_

