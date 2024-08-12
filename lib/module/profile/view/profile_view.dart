import 'package:find_kajian/shared/util/dialog/awesome_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:find_kajian/state_util.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:find_kajian/module/update_profile/view/update_profile_view.dart';
import 'package:find_kajian/module/privacy_policy/view/privacy_policy_view.dart';
import 'package:find_kajian/module/terms_conditions/view/terms_conditions_view.dart';
import 'package:intl/intl.dart';

import '../controller/profile_controller.dart';
import '../state/profile_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController controller = ProfileController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<ProfileController>()) {
      GetIt.I.unregister<ProfileController>();
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.getCurrentUser();
  }

  void _navigateToUpdateProfile() async {
    final result = await Get.to(UpdateProfileView());

    // Tangani hasil dari UpdateProfileView jika diperlukan
    if (result == true) {
      // Misalnya, refresh data atau lakukan sesuatu setelah update berhasil
      controller.getCurrentUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<ProfileController, ProfileState>(
        listener: (context, state) {},
        child: BlocBuilder<ProfileController, ProfileState>(
          builder: (context, state) {
            final bloc = context.read<ProfileController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    ProfileController controller,
    ProfileState state,
  ) {
    return Scaffold(
      body: Column(
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 20),
            child: Center(
              child: Text(
                "Profile",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      margin: EdgeInsets.fromLTRB(12, 12, 12, 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Profile Pic
                                  Icon(
                                    Icons.account_circle,
                                    size: 40,
                                    color: tertiaryColor,
                                  ),

                                  const SizedBox(width: 8.0),

                                  // Name & Email
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.userData["name"] == null ||
                                                state.userData["name"].isEmpty
                                            ? 'Nama belum diatur'
                                            : state.userData['name'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        state.userData["email"] == null ||
                                                state.userData["email"].isEmpty
                                            ? 'Email belum diatur'
                                            : state.userData['email'],
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () => _navigateToUpdateProfile(),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.edit_square,
                                          size: 18,
                                          color: tertiaryColor,
                                        ),
                                        const SizedBox(width: 2.5),
                                        Text(
                                          "Edit",
                                          style: TextStyle(
                                              fontSize: 14.5,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey[400],
                            ),
                            // Profile Data
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 12, 5, 5),
                                  child: Row(
                                    children: [
                                      // icon whatsapp
                                      Icon(Icons.phone_android,
                                          size: 24, color: tertiaryColor),
                                      const SizedBox(
                                        width: 10.0,
                                      ),

                                      // Nomor whatsapp
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Nomor Telepon",
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            state.userData["nomor_wa"] ==
                                                        null ||
                                                    state.userData["nomor_wa"]
                                                        .isEmpty
                                                ? 'Nomor whatshapp belum diatur'
                                                : state.userData['nomor_wa'],
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                // Tgl Lahir
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      // icon alamat
                                      Icon(Icons.date_range_rounded,
                                          size: 24, color: tertiaryColor),
                                      const SizedBox(
                                        width: 10.0,
                                      ),

                                      // alamat
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tanggal Lahir",
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            state.userData["tgl_lahir"] ==
                                                        null ||
                                                    state.userData["tgl_lahir"]
                                                        .isEmpty
                                                ? 'Tanggal Lahir belum diatur'
                                                : DateFormat('dd-MM-yyyy')
                                                    .format(DateTime.parse(
                                                        state.userData[
                                                            'tgl_lahir'])),
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                // Jenis Kelamani
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      // icon alamat
                                      Icon(Icons.people_alt_outlined,
                                          size: 24, color: tertiaryColor),
                                      const SizedBox(
                                        width: 10.0,
                                      ),

                                      // alamat
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Jenis Kelamin",
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            state.userData["jenis_kelamin"] ==
                                                        null ||
                                                    state
                                                        .userData[
                                                            "jenis_kelamin"]
                                                        .isEmpty
                                                ? 'Jenis kelamin belum diatur'
                                                : state
                                                    .userData['jenis_kelamin'],
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                // Alamat
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      // icon alamat
                                      Icon(Icons.location_on,
                                          size: 24, color: tertiaryColor),
                                      const SizedBox(
                                        width: 10.0,
                                      ),

                                      // alamat
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Alamat",
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            state.userData['alamat'] == null ||
                                                    state.userData['alamat']
                                                        .isEmpty
                                                ? 'Alamat belum diatur'
                                                : state.userData['alamat'],
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                // Pekerjaan
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      // icon alamat
                                      Icon(Icons.work,
                                          size: 24, color: tertiaryColor),
                                      const SizedBox(
                                        width: 10.0,
                                      ),

                                      // alamat
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Pekerjaan",
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            state.userData["pekerjaan"] ==
                                                        null ||
                                                    state.userData["pekerjaan"]
                                                        .isEmpty
                                                ? 'Pekerjaan belum diatur'
                                                : state.userData['pekerjaan'],
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // end Profile

                    Card(
                      margin: EdgeInsets.fromLTRB(12, 20, 12, 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => Get.to(PrivacyPolicyView()),
                              child: Container(
                                color: Colors.transparent,
                                height: 42,
                                margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Row(
                                  children: [
                                    // icon kebijakan privasi
                                    Icon(Icons.privacy_tip,
                                        size: 24, color: tertiaryColor),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Kebijakan Privasi",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey[400],
                            ),

                            // Terms and Conditions
                            GestureDetector(
                              onTap: () => Get.to(TermsConditionsView()),
                              child: Container(
                                color: Colors.transparent,
                                height: 45,
                                margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Row(
                                  children: [
                                    // icon syarat dan ketentuan
                                    Icon(Icons.assignment,
                                        size: 24, color: tertiaryColor),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Syarat & Ketentuan",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey[400],
                            ),

                            // Share
                            GestureDetector(
                              onTap: () => controller.shareLink(),
                              child: Container(
                                color: Colors.transparent,
                                height: 45,
                                margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Row(
                                  children: [
                                    // icon share
                                    Icon(Icons.share,
                                        size: 24, color: tertiaryColor),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Sebarkan Aplikasi (Pahala Jariyah)",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey[400],
                            ),
                            // logout
                            GestureDetector(
                              onTap: () {
                                AwesomeConfirmationDialog(
                                  title: 'Konfirmasi',
                                  desc:
                                      'Apakah Anda akan keluar dari akun Find Kajian?',
                                  type: DialogType.question,
                                  okText: 'Ya, Keluar',
                                  cancelText: 'Batal',
                                  onOkPressed: () {
                                    controller.logout();
                                  },
                                );
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: 42,
                                margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Row(
                                  children: [
                                    // icon share
                                    Icon(Icons.exit_to_app,
                                        size: 25, color: Color(0xffff6961)),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Keluar dari akun",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color(0xffff6961),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    state.isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Versi Aplikasi: 1.0.2',
                              style: TextStyle(color: secondaryTextColor),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text(
                              'Versi Aplikasi: ${state.version}',
                              style: TextStyle(color: secondaryTextColor),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
