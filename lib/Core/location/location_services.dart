import 'package:geolocator/geolocator.dart';
import 'package:my_kid/Core/const/Messages.dart';

class LocationServices {
Future<Position> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception(Messages.locationServicesAreDenied);
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception(Messages.locationpermissionsAreDenied);
    }
  }
  if (permission == LocationPermission.deniedForever) {
          throw Exception(Messages.locationpermissionsAreDenied);

  }

  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}
Future<String> getCityNameFromPosition(Position position)
}
abstract class LocationRepository{
  Future<Position> getCurrentPosition();
}

class LocationRepositoryImpl implements LocationRepository{
  final LocationServices locationServices;
  LocationRepositoryImpl(this.locationServices)
  @override
  Future<Position> getCurrentPosition() {
    return locationServices.getCurrentLocation();
  }
  
}