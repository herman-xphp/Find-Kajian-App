import 'package:find_kajian/service/api_service/api_service.dart';

class UstadzKajianService extends ApiService {
  // final String ustadzId;

  // UstadzKajianService(this.ustadzId);
  UstadzKajianService();

  @override
  String get endpoint => "ustadz";
  String get content => "kajian";
}
