import 'package:find_kajian/shared/util/db_service/db_service.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> openMap(double latitude, double longitude) async {
    String? latitudeUser = await DBService.get('latitude');
    String? longitudeUser = await DBService.get('longitude');

    final googleUrl =
        // 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
        "https://www.google.com/maps/dir/?api=1&origin=$latitudeUser,$longitudeUser&destination=$latitude,$longitude";
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> invitation(String phoneNumber) async {
    String phone = phoneNumber; //0896
    String validNumberPhone = phone.substring(1); //896

    // String eventName = 'Seminar Agama'; // Ganti dengan nama acara yang sesuai
    // String eventDate = '20 Agustus 2023'; // Ganti dengan tanggal acara yang sesuai
    // String eventLocation = 'Masjid Al-Hikmah'; // Ganti dengan lokasi acara yang sesuai

    // Pesan undangan dengan tanda <TEKS_YANG_INGIN_DITEBAKAN>
    String invitationMessage = """
Assalamu'alaikum Warahmatullahi Wabarakatuh,

Dengan hormat,

Kami ingin mengundang Anda untuk hadir dalam acara kami dengan rincian sebagai berikut:

Nama Acara: [Nama Acara]
Tanggal: [Tanggal Acara]
Tempat: [Tempat Acara]
Tema Acara: [Tema Acara]

Kami percaya bahwa kehadiran serta pencerahan dari Ustadz seperti Anda akan memberikan nilai lebih pada acara kami dan memberikan wawasan yang berharga kepada para peserta.

Mohon konfirmasi kehadiran Anda serta informasi teknis yang diperlukan dari pihak kami. Apabila terdapat persyaratan khusus, harap beritahu kami agar kami dapat mempersiapkan segala sesuatunya dengan baik.

Kami sangat menghargai kesempatan untuk dapat berkolaborasi dengan Anda dalam acara ini. Semoga Allah SWT senantiasa memberkahi Anda dalam segala aktivitas dan usaha.

Harap kami dapat menerima konfirmasi kehadiran Anda paling lambat pada [tanggal konfirmasi]. Untuk informasi lebih lanjut, silakan hubungi kami melalui nomor telepon yang tertera di atas.

Terima kasih atas perhatian dan waktu Anda.

Wassalamu'alaikum Warahmatullahi Wabarakatuh""";

    // Format dan enkripsi pesan untuk tautan WhatsApp
    String encodedMessage = Uri.encodeComponent(invitationMessage);

    // Buat tautan WhatsApp dengan pesan dan kursor ke teks yang ingin diubah
    Uri whatsappLink = Uri.parse(
        'https://wa.me/62$validNumberPhone/?text=$encodedMessage&cursor=$encodedMessage');

    if (!await launchUrl(whatsappLink,
        mode: LaunchMode.externalNonBrowserApplication)) {
      throw 'Could not open the Map';
    }
  }

  static Future<void> openYoutube(String youtubeLink) async {
    Uri url = Uri.parse(youtubeLink);
    if (!await launchUrl(url, mode: LaunchMode.externalNonBrowserApplication)) {
      throw 'Could not open the Map';
    }
    // String channelName = youtubeLink;
    // List<String> words = channelName.split(" "); // Memecah berdasarkan spasi
    // for (String word in words) {
    //   print(word);
    // }
  }
}
