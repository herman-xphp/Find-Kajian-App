import 'package:find_kajian/service/api_service/api_service.dart';

class MasjidKajianService extends ApiService {
  // final String latitude;
  // final String longitude;
  // final String idMasjid;

  // MasjidKajianService(this.latitude, this.longitude);
  // MasjidKajianService(this.idMasjid);
  MasjidKajianService();

  @override
  String get endpoint => "tempat-kajian";
  String get content => "kajian";

  // Future<Map<String, dynamic>?> getCurrentMasjid() async {
  //   var token = await DBService.get("token");
  //   if (token == null) {
  //     return null;
  //   }

  //   try {
  //     var response = await Dio().get(
  //       "https://findkajian.elayanan.info/api/tempat-kajian/$idMasjid/current",
  //       options: Options(
  //         headers: {
  //           "Content-Type": "application/json",
  //           "Authorization": "Bearer $token",
  //         },
  //       ),
  //     );
  //     return response.data["data"];
  //   } catch (e) {
  //     print("Error fetching user data: $e");
  //     return null;
  //   }
  // }
}
