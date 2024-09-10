import 'package:dio/dio.dart';
import 'package:find_kajian/module/login/view/login_view.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';
import 'package:find_kajian/state_util.dart';
import 'package:find_kajian/config.dart';

class AuthService {
  late final String? token;
  String baseUrl = AppConfig.baseUrl;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    print(baseUrl);
    final String url = '$baseUrl/api/login';

    try {
      var response = await Dio().post(
        url,
        options: Options(
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        var data = response.data;
        // print(data);
        token = data["token"];

        await DBService.set("token", token!);
        return true;
      }
      return false;
    } on DioException catch (e) {
      print("Dio error: ${e.response?.data}");
      return false;
    } catch (error) {
      print("Unexpected error: $error");
      return false;
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirm_password,
  }) async {
    final String url = '$baseUrl/api/register';

    try {
      var response = await Dio().post(
        url,
        options: Options(
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
        data: {
          "name": name,
          "email": email,
          "no_telp": phone,
          "password": password,
          "password_confirmation": confirm_password,
        },
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } on DioException catch (e) {
      print("Dio error: ${e.response?.data}");
      return false;
    } catch (error) {
      print("Unexpected error: $error");
      return false;
    }
  }

  static Future<bool> get isLoggedIn async {
    return await DBService.get("token") != null;
  }

  Future<void> logout() async {
    await DBService.clear("token");
    await DBService.clear("latitude");
    await DBService.clear("longitude");
    await DBService.clear("address");
    await DBService.clear("fullAddress");
    token = null;
    Get.offAll(LoginView());
  }
}
