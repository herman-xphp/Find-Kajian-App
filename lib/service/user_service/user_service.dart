import 'package:dio/dio.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';

class UserService {
  Future<Map<String, dynamic>?> getCurrentUser() async {
    var token = await DBService.get("token");
    if (token == null) {
      return null;
    }

    try {
      var response = await Dio().get(
        "https://findkajian.elayanan.info/api/user/current",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );
      return response.data["data"];
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
  }

  Future<bool> updateCurrentUser({
    required String name,
    required String email,
    required String phone,
    String? gender,
    String? dateOfBirth,
    String? address,
    String? occupation,
  }) async {
    final token = await DBService.get("token");

    if (token == null) {
      return false;
    }

    try {
      var response = await Dio().patch(
        "https://findkajian.elayanan.info/api/user/current",
        options: Options(
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "name": name,
          "email": email,
          "nomor_wa": phone,
          "jenis_kelamin": gender,
          "tgl_lahir": dateOfBirth,
          "alamat": address,
          "pekerjaan": occupation,
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print("Error updating user data: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error updating user data: $e");
      return false;
    }
  }
}
