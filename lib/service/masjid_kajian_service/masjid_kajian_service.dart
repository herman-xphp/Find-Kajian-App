import 'package:dio/dio.dart';
import 'package:find_kajian/config.dart';

class MasjidKajianService {
  String baseUrl = AppConfig.baseUrl;
  String? token = AppConfig.token;
  String endpoint = "tempat-kajian";

  Future<List<Map<String, dynamic>>> getById(String id) async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/$endpoint/$id/kajian';

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
        throw Exception(
            "Format response tidak valid: Diharapkan Map<String, dynamic>");
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }

  Future<Map<String, dynamic>?> getCurrent(String id) async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/$endpoint/$id/current';

    try {
      var response = await dio.get(
        url,
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
}
