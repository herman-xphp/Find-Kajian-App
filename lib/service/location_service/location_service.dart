import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:find_kajian/shared/util/dialog/awesome_confirmation_dialog.dart';
import 'package:find_kajian/shared/util/dialog/show_awesome_dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showEnableGPSDialog();
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showEnableGPSDialog();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  static Future<void> saveLocation(String latitude, String longitude) async {
    await DBService.set("latitude", latitude);
    await DBService.set("longitude", longitude);
    print("latitude dan longitude berhasil tersimpan!");
  }

  static Future<String> getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        // return '${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}';
        return '${place.subAdministrativeArea}';
      } else {
        return 'No address available';
      }
    } catch (e) {
      print(e);
      return 'Error occurred while fetching address';
    }
  }

  static Future<String> getFullAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return '${place.street}, ${place.locality}, ${place.subAdministrativeArea}';
      } else {
        return 'No address available';
      }
    } catch (e) {
      print(e);
      return 'Error occurred while fetching address';
    }
  }

  Future<void> saveCurrentLocationWithAddress() async {
    try {
      Position position = await getCurrentLocation();
      String latitude = position.latitude.toString();
      String longitude = position.longitude.toString();
      await saveLocation(latitude, longitude);

      String address = await getAddressFromCoordinates(
          position.latitude, position.longitude);
      String fullAddress = await getFullAddressFromCoordinates(
          position.latitude, position.longitude);
      print("address: $address");
      print("fullAddress: $fullAddress");

      // Simpan alamat jika diperlukan
      await DBService.set("address", address);
      await DBService.set("fullAddress", fullAddress);
    } catch (e) {
      print(e);
    }
  }

  // bool _isGPSDialogShown = false;

  void _showEnableGPSDialog() async {
    await AwesomeConfirmationDialog(
        title: 'Aktifkan Lokasi',
        desc:
            'Lokasi atau GPS Anda tidak aktif. \nSilakan aktifkan untuk melanjutkan.',
        type: DialogType.warning,
        onOkPressed: () async {
          try {
            // Coba mendapatkan lokasi lagi setelah mengaktifkan GPS
            await Geolocator.openLocationSettings();

            await showAwesomeDialog(
              title: 'Lokasi Aktif',
              desc:
                  'Silahkan Refresh lokasi anda untuk mendapatkan lokasi terbaru.',
              onOkPressed: () async {
                try {
                  await getCurrentLocation();
                } catch (e) {
                  print('Gagal mendapatkan lokasi: $e');
                }
              },
            );
          } catch (e) {
            print('Gagal mendapatkan lokasi: $e');
          }
        },
        cancelText: 'Lain kali');
  }
}
