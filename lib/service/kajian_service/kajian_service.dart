import 'package:find_kajian/service/api_service/api_service.dart';

class KajianService extends ApiService {
  final String latitude;
  final String longitude;

  KajianService(this.latitude, this.longitude);

  @override
  String get endpoint => "kajian?latitude=$latitude&longitude=$longitude";
}
