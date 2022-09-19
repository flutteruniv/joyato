import 'package:location/location.dart';

Location _location = Location();

bool? _serviceEnabled;
PermissionStatus? _permissionGranted;
LocationData? locationData;

///　現在地を取得する関数
Future<void> getLocationData() async {
  locationData = await _location.getLocation();
}

/// LocationServiceが有効か確認する関数
Future<void> locationServiceEnabledCheck() async {
  _serviceEnabled = await _location.serviceEnabled();
  if (_serviceEnabled == null) {
    _serviceEnabled = await _location.requestService();
    if (_serviceEnabled == null) {
      return;
    }
  }
}

/// Permissionが有効か確認する関数
Future<void> permissionCheck() async {
  _permissionGranted = await _location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await _location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
}
