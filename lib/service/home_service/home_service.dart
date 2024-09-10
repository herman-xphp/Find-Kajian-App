import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:find_kajian/config.dart';
import 'package:find_kajian/service/api_service/api_service.dart';
import 'package:find_kajian/service/auth_service/auth_service.dart';
import 'package:find_kajian/shared/util/dialog/show_awesome_dialog.dart';

class HomeService extends ApiService {
  String baseUrl = AppConfig.baseUrl;
  late final String? token = AppConfig.token;

  @override
  String get endpoint => "tempat-kajian/top";

  Future<List<Map<String, dynamic>>> latestKajian() async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/kajian/latest';

    print(token);
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.data is Map<String, dynamic>) {
        // Asumsi struktur response adalah Map dengan kunci 'data' yang berupa List dari Map
        if (response.data.containsKey('data') &&
            response.data['data'] is List) {
          return List<Map<String, dynamic>>.from(response.data['data']);
        } else {
          throw Exception(
              "Format data tidak valid: kunci 'data' tidak ditemukan atau bukan List");
        }
      } else {
        print(response.data);
        showAwesomeDialog(
            title: 'Maaf',
            desc: 'Sesi telah habis, harap login ulang.',
            type: DialogType.warning,
            onOkPressed: () {
              AuthService().logout();
              // Get.to(LoginView());
            });
        throw Exception(
            "Format response tidak valid: Diharapkan Map<String, dynamic>");
      }
    } on DioException catch (e) {
      print("Dio error: ${e.response?.data}");
      throw Exception("Dio error: ${e.response?.data}");
    } catch (error) {
      print('error home service ka?');
      print('Error: $error');
      throw error;
    }
  }
}
