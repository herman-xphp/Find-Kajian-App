import 'package:find_kajian/shared/util/db_service/db_service.dart';

class AppConfig {
  static String baseUrl = "https://www.findkajian.my.id";
  static String? token = DBService.get('token');
  static String googleMapApiKey = "YOUR_API_KEY";
}
