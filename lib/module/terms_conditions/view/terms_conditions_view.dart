import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/terms_conditions_controller.dart';
import '../state/terms_conditions_state.dart';
import 'package:get_it/get_it.dart';

class TermsConditionsView extends StatefulWidget {
  const TermsConditionsView({Key? key}) : super(key: key);

  @override
  State<TermsConditionsView> createState() => _TermsConditionsViewState();
}

class _TermsConditionsViewState extends State<TermsConditionsView> {
  TermsConditionsController controller = TermsConditionsController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<TermsConditionsController>()) {
      GetIt.I.unregister<TermsConditionsController>();
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
      child: BlocListener<TermsConditionsController, TermsConditionsState>(
        listener: (context, state) {},
        child: BlocBuilder<TermsConditionsController, TermsConditionsState>(
          builder: (context, state) {
            final bloc = context.read<TermsConditionsController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    TermsConditionsController controller,
    TermsConditionsState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Syarat dan Ketentuan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Syarat dan Ketentuan',
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
              buildTermsSection('1. Ketentuan Umum', [
                'Aplikasi Find Kajian ini disediakan untuk memudahkan umat Islam dalam mencari kajian.',
                'Dengan menggunakan aplikasi ini, Anda setuju untuk mematuhi syarat dan ketentuan yang berlaku.'
              ]),
              buildTermsSection('2. Penggunaan Aplikasi', [
                'Pengguna bertanggung jawab atas setiap informasi yang diberikan dan tindakan yang dilakukan melalui aplikasi ini.',
                'Aplikasi ini tidak boleh digunakan untuk tujuan yang bertentangan dengan ajaran Islam dan hukum yang berlaku.',
                'Pengguna diharapkan untuk menggunakan aplikasi ini dengan niat yang baik dan ikhlas dalam mencari ilmu.'
              ]),
              buildTermsSection('3. Konten Kajian', [
                'Kami berusaha untuk menyajikan informasi kajian yang akurat dan bermanfaat.',
                'Namun, kami tidak bertanggung jawab atas kesalahan atau ketidakakuratan informasi yang disampaikan oleh pihak ketiga.'
              ]),
              buildTermsSection('4. Tanggung Jawab Pengguna', [
                'Pengguna wajib menjaga kerahasiaan informasi pribadinya dan tidak memberikannya kepada pihak lain.',
                'Pengguna bertanggung jawab penuh atas setiap aktivitas yang dilakukan melalui akun mereka.'
              ]),
              buildTermsSection('5. Pembaruan', [
                'Syarat dan ketentuan ini dapat diubah sewaktu-waktu tanpa pemberitahuan sebelumnya.',
                'Pengguna diharapkan untuk memeriksa halaman ini secara berkala untuk mengetahui pembaruan yang berlaku.'
              ]),
              buildTermsSection('6. Batasan Tanggung Jawab', [
                'Find Kajian tidak bertanggung jawab atas kerugian atau kerusakan yang diakibatkan oleh penggunaan aplikasi ini.',
                'Kami tidak memberikan jaminan bahwa aplikasi ini akan bebas dari kesalahan atau gangguan.'
              ]),
              buildTermsSection('7. Hukum yang Berlaku', [
                'Syarat dan ketentuan ini diatur dan ditafsirkan sesuai dengan hukum Republik Indonesia.',
                'Sengketa yang timbul dari penggunaan aplikasi ini akan diselesaikan melalui musyawarah untuk mufakat.'
              ]),
              buildTermsSection('8. Kontak Kami', [
                'Jika Anda memiliki pertanyaan atau kekhawatiran terkait syarat dan ketentuan ini, silakan hubungi kami melalui email di support@findkajian.com.'
              ]),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
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

  Widget buildTermsSection(String title, List<String> items) {
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
