import 'package:prueba_tecnica/models/latlng_model.dart';
import 'package:location/location.dart' as locat;

Future<LatLng> getPosition() async {
  final locat.Location location = locat.Location();
  if (!await location.serviceEnabled()) {
    if (!await location.requestService())
      throw 'El Servicio GPS esta desactivado';
  }
  if (await location.hasPermission() == locat.PermissionStatus.denied) {
    if (await location.requestPermission() != locat.PermissionStatus.granted)
      throw 'No tiene acceso al GPS';
  }
  final locat.LocationData data = await location.getLocation();
  print(data.latitude);
  return LatLng(data.latitude!, data.longitude!);
}
