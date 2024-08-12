import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/privacy_policy_controller.dart';
import '../state/privacy_policy_state.dart';
import 'package:get_it/get_it.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  PrivacyPolicyController controller = PrivacyPolicyController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<PrivacyPolicyController>()) {
      GetIt.I.unregister<PrivacyPolicyController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<PrivacyPolicyController, PrivacyPolicyState>(
        listener: (context, state) {},
        child: BlocBuilder<PrivacyPolicyController, PrivacyPolicyState>(
          builder: (context, state) {
            final bloc = context.read<PrivacyPolicyController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PrivacyPolicyController controller,
    PrivacyPolicyState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kebijakan Privasi',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Kebijakan Privasi',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم\n'
                'Assalamu’alaikum Warahmatullahi Wabarakatuh,\n\n',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              buildPrivacySection('1. Pengumpulan Informasi', [
                'Kami mengumpulkan informasi yang Anda berikan secara langsung saat menggunakan aplikasi ini, seperti nama, alamat email, dan informasi lainnya yang diperlukan.',
                'Kami juga mengumpulkan informasi secara otomatis terkait penggunaan aplikasi, termasuk tetapi tidak terbatas pada alamat IP, jenis perangkat, dan aktivitas penggunaan.'
              ]),
              buildPrivacySection('2. Penggunaan Informasi', [
                'Informasi yang dikumpulkan digunakan untuk meningkatkan kualitas layanan aplikasi dan memberikan pengalaman yang lebih baik bagi pengguna.',
                'Informasi juga dapat digunakan untuk berkomunikasi dengan pengguna terkait layanan aplikasi, termasuk pemberitahuan, pembaruan, dan penawaran khusus.'
              ]),
              buildPrivacySection('3. Pengungkapan Informasi', [
                'Kami tidak akan mengungkapkan informasi pribadi pengguna kepada pihak ketiga tanpa persetujuan pengguna, kecuali jika diwajibkan oleh hukum atau perintah pengadilan.',
                'Kami dapat berbagi informasi dengan mitra tepercaya yang membantu kami dalam mengoperasikan aplikasi dan menyediakan layanan kepada pengguna, dengan syarat mereka menjaga kerahasiaan informasi tersebut.'
              ]),
              buildPrivacySection('4. Keamanan Informasi', [
                'Kami berkomitmen untuk melindungi informasi pengguna dari akses, penggunaan, atau pengungkapan yang tidak sah.',
                'Kami menggunakan berbagai langkah keamanan teknis, administratif, dan fisik untuk menjaga keamanan informasi pengguna.'
              ]),
              buildPrivacySection('5. Penyimpanan Informasi', [
                'Informasi pengguna akan disimpan selama diperlukan untuk memenuhi tujuan pengumpulan informasi tersebut, kecuali jika diwajibkan oleh hukum untuk menyimpan lebih lama.',
                'Kami akan menghapus atau menganonimkan informasi pribadi pengguna ketika tidak lagi diperlukan.'
              ]),
              buildPrivacySection('6. Hak Pengguna', [
                'Pengguna memiliki hak untuk mengakses, memperbarui, atau menghapus informasi pribadi mereka yang disimpan oleh kami.',
                'Pengguna dapat menghubungi kami untuk menggunakan hak-hak tersebut melalui email di support@findkajian.com.'
              ]),
              buildPrivacySection('7. Perubahan Kebijakan', [
                'Kebijakan privasi ini dapat diperbarui sewaktu-waktu untuk mencerminkan perubahan dalam praktik kami atau peraturan yang berlaku.',
                'Kami akan memberitahu pengguna tentang perubahan kebijakan melalui aplikasi atau sarana lain yang dianggap sesuai.'
              ]),
              buildPrivacySection('8. Kontak Kami', [
                'Jika Anda memiliki pertanyaan atau kekhawatiran terkait kebijakan privasi ini, silakan hubungi kami melalui email di support@findkajian.com.'
              ]),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Wassalamu’alaikum Warahmatullahi Wabarakatuh.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPrivacySection(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items
                .map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('•', style: TextStyle(fontSize: 18)),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item,
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
