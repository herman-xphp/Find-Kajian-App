import 'package:dio/dio.dart';
import 'package:find_kajian/config.dart';

class SearchService {
  String baseUrl = AppConfig.baseUrl;
  String endpoint = "search";
  String? token = AppConfig.token;

  Future<List<Map<String, dynamic>>> search(String query,
      {String? type}) async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/$endpoint';

    // print(token);

    try {
      final response = await dio.get(
        url,
        queryParameters: {
          'query': query,
          'type': type,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.data is Map<String, dynamic>) {
        // Asumsi struktur response adalah Map dengan kunci 'data' yang berupa List dari Map
        if (response.data['kajians'].isEmpty ||
            response.data['kajians'] == null) {
          return List<Map<String, dynamic>>.from(
              response.data['tempatKajians']);
        } else {
          print('kalau ada masuk sini!!!');
          return List<Map<String, dynamic>>.from(response.data['kajians']);
        }
      } else {
        print(response.data);
        throw Exception(
            "Format response tidak valid: Diharapkan Map<String, dynamic>");
      }
    } on DioException catch (e) {
      print(e.response?.data);
      throw ('Terjadi kesalahan: ${e.message}');
    } catch (error) {
      throw ('error: $error');
    }
  }
}
