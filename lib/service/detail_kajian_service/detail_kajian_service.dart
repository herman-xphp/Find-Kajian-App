import 'package:dio/dio.dart';
import 'package:find_kajian/config.dart';

class DetailKajianService {
  String baseUrl = AppConfig.baseUrl;
  late String? token = AppConfig.token;

  String endpoint = "kajian";

  Future<Map<String, dynamic>> showKajian(String id) async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/$endpoint/$id';

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
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> getKajianReviewByKajianId(
      String id) async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/$endpoint/$id/reviews';

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

  Future<bool> save({
    required int kajianId,
    required int userId,
    required String content,
  }) async {
    final String url = '$baseUrl/api/$endpoint/reviews';

    try {
      var response = await Dio().post(
        url,
        options: Options(
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "kajian_id": kajianId,
          "content": content,
          "user_id": userId,
        },
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } on DioException catch (e) {
      print("Dio error: ${e.response?.data}");
      return false;
    } catch (error) {
      print("Error updating user data: $error");
      return false;
    }
  }

  Future<bool> update({
    required int reviewId,
    required String content,
  }) async {
    final String url = '$baseUrl/api/$endpoint/reviews/$reviewId';

    try {
      var response = await Dio().put(
        url,
        options: Options(
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "content": content,
        },
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } on DioException catch (e) {
      print("Dio error: ${e.response?.data}");
      return false;
    } catch (error) {
      print("Error updating user data: $error");
      return false;
    }
  }

  Future<bool> delete({
    required int reviewId,
  }) async {
    final String url = '$baseUrl/api/$endpoint/reviews/$reviewId';

    try {
      var response = await Dio().delete(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      return response.statusCode == 200 || response.statusCode == 204;
    } on DioException catch (e) {
      print("Dio error: ${e.response?.data}");
      return false;
    } catch (error) {
      print("Error deleting review: $error");
      return false;
    }
  }
}
