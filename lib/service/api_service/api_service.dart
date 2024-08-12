import 'package:dio/dio.dart';
import 'package:find_kajian/config.dart';

class ApiService {
  String baseUrl = AppConfig.baseUrl;
  String endpoint = "";
  String content = "";
  late String? token = AppConfig.token;

  Future<List<Map<String, dynamic>>> get() async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/$endpoint';

    // print(token);

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

  Future<List<Map<String, dynamic>>> getById(String id) async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/$endpoint/$id/$content';

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

  Future<Map<String, dynamic>> create(Map<String, dynamic> data) async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/$endpoint';

    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      return Map<String, dynamic>.from(response.data['data']);
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> update(int id, Map<String, dynamic> data) async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/$endpoint/$id';

    try {
      final response = await dio.put(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      return Map<String, dynamic>.from(response.data['data']);
    } catch (e) {
      throw e;
    }
  }

  Future<void> delete(int id) async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/$endpoint/$id';

    try {
      await dio.delete(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteAll() async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/$endpoint/action/delete-all';

    try {
      await dio.delete(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
    } catch (e) {
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> search(String query) async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/$endpoint/search';
    try {
      final response = await dio.get(
        url,
        queryParameters: {
          'query': query,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.data is Map<String, dynamic>) {
        // print(response.data);
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
