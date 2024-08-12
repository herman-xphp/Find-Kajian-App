import 'package:find_kajian/service/api_service/api_service.dart';

class HomeService extends ApiService {
  final String latitude;
  final String longitude;

  HomeService(this.latitude, this.longitude);

  @override
  String get endpoint =>
      "kajian/latest?latitude=$latitude&longitude=$longitude";
}
