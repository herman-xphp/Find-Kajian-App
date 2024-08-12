import 'package:find_kajian/shared/util/db_service/db_service.dart';

class AppConfig {
  static String baseUrl = "https://findkajian.elayanan.info";
  static String? token = DBService.get('token');
  static String googleMapApiKey = "YOUR_API_KEY";
}
