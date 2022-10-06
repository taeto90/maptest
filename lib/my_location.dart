import 'package:geolocator/geolocator.dart';
import '';

class MyLocation{
  double? latitude;
  double? longitude;

  Future<void> getMyCurrentLocation() async{
    try{
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude=position.latitude;
      longitude=position.longitude;
      print('---------------------------getMyCurrentLocation');
      print(latitude);
      print(longitude);}
    catch(e){
      print('Teere was a problems with the internet connection');

    }
  }
}

