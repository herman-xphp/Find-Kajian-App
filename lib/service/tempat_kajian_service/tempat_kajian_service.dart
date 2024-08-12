import 'package:find_kajian/service/api_service/api_service.dart';

class TempatKajianService extends ApiService {
  final String latitude;
  final String longitude;

  TempatKajianService(this.latitude, this.longitude);

  @override
  String get endpoint =>
      "tempat-kajian?latitude=$latitude&longitude=$longitude";
}
