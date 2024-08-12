import 'package:dio/dio.dart';
import 'package:find_kajian/config.dart';
import 'package:find_kajian/service/api_service/api_service.dart';

class HomeService extends ApiService {
  String baseUrl = AppConfig.baseUrl;
  String? token = AppConfig.token;

  @override
  String get endpoint => "tempat-kajian/top";

  Future<List<Map<String, dynamic>>> latestKajian() async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/kajian/latest';

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
          // print(response.data);
          throw Exception(
              "Format data tidak valid: kunci 'data' tidak ditemukan atau bukan List");
        }
      } else {
        // print(response.data);
        throw Exception(
            "Format response tidak valid: Diharapkan Map<String, dynamic>");
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }
}
