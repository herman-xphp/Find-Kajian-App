// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:find_kajian/shared/theme/theme_config.dart';
// import 'package:find_kajian/shared/util/dialog/show_awesome_dialog.dart';
// import 'package:find_kajian/shared/util/validator/validator.dart';
// import 'package:find_kajian/shared/widget/form/button/button.dart';
// import 'package:find_kajian/shared/widget/form/textfield/text_field.dart';
// import 'package:find_kajian/state_util.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../controller/update_profile_controller.dart';
// import '../state/update_profile_state.dart';
// import 'package:get_it/get_it.dart';

// class UpdateProfileView extends StatefulWidget {
//   const UpdateProfileView({Key? key}) : super(key: key);

//   @override
//   State<UpdateProfileView> createState() => _UpdateProfileViewState();
// }

// class _UpdateProfileViewState extends State<UpdateProfileView> {
//   UpdateProfileController controller = UpdateProfileController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     if (GetIt.I.isRegistered<UpdateProfileController>()) {
//       GetIt.I.unregister<UpdateProfileController>();
//     }
//     GetIt.I.registerSingleton(controller);
//     controller.initState();
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) => controller.ready(),
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => controller,
//       child: BlocListener<UpdateProfileController, UpdateProfileState>(
//         listener: (context, state) {},
//         child: BlocBuilder<UpdateProfileController, UpdateProfileState>(
//           builder: (context, state) {
//             final bloc = context.read<UpdateProfileController>();
//             return buildView(context, bloc, state);
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildView(
//     BuildContext context,
//     UpdateProfileController controller,
//     UpdateProfileState state,
//   ) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true, // Mengatur agar konten tidak naik
//       appBar: AppBar(
//         title: const Text(
//           'Edit Profil',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: state.isLoading
//           ? Center(child: CircularProgressIndicator())
//           : state.error != null
//               ? Center(child: Text('Error: ${state.error}'))
//               : SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       // Heading
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(
//                                   top: 20, left: 24.0, right: 24.0),
//                               child: Text(
//                                 "Edit Profil Anda",
//                                 style: TextStyle(
//                                   fontSize: 26.0,
//                                   fontWeight: FontWeight.w900,
//                                   letterSpacing: 1.0,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 top: 10.0,
//                                 bottom: 5.0,
//                                 left: 24.0,
//                               ),
//                               child: Text(
//                                 "Isi data diri anda.",
//                                 style: TextStyle(
//                                     fontSize: 16.0,
//                                     fontWeight: FontWeight.w600,
//                                     color: secondaryTextColor),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       // form login
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
//                         child: Container(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Form(
//                             key: formKey,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 QTextField(
//                                   hint: 'Nama',
//                                   validator: Validator.required,
//                                   prefixIcon: Icons.person_rounded,
//                                   value: state.userData["name"] ??
//                                       '', // Menampilkan data lama
//                                   onChanged: (value) {
//                                     state.userData["name"] = value;
//                                   },
//                                 ),
//                                 const SizedBox(
//                                   height: 18.0,
//                                 ),
//                                 QTextField(
//                                   hint: 'Email',
//                                   validator: Validator.email,
//                                   prefixIcon: Icons.email,
//                                   value: state.userData["email"] ??
//                                       '', // Menampilkan data lama
//                                   onChanged: (value) {
//                                     state.userData["email"] = value;
//                                   },
//                                 ),
//                                 const SizedBox(
//                                   height: 18.0,
//                                 ),
//                                 QTextField(
//                                   hint: 'Nomor Telepon',
//                                   validator: Validator.number,
//                                   prefixIcon: Icons.phone,
//                                   value: state.userData["nomor_wa"] ??
//                                       '', // Menampilkan data lama
//                                   onChanged: (value) {
//                                     state.userData["nomor_wa"] = value;
//                                   },
//                                 ),
//                                 const SizedBox(
//                                   height: 18.0,
//                                 ),
//                                 QTextField(
//                                   hint: 'Alamat',
//                                   validator: Validator.required,
//                                   prefixIcon: Icons.location_on,
//                                   value: state.userData["alamat"] ??
//                                       '', // Menampilkan data lama
//                                   onChanged: (value) {
//                                     state.userData["alamat"] = value;
//                                   },
//                                 ),
//                                 const SizedBox(
//                                   height: 18.0,
//                                 ),
//                                 QTextField(
//                                   hint: 'Pekerjaan',
//                                   validator: Validator.required,
//                                   prefixIcon: Icons.work,
//                                   value: state.userData["pekerjaan"] ??
//                                       '', // Menampilkan data lama
//                                   onChanged: (value) {
//                                     state.userData["pekerjaan"] = value;
//                                   },
//                                 ),
//                                 const SizedBox(
//                                   height: 22.0,
//                                 ),
//                                 QButton(
//                                   label: "Simpan",
//                                   color: tertiaryColor,
//                                   onPressed: () {
//                                     bool isValid =
//                                         formKey.currentState!.validate();
//                                     if (!isValid) {
//                                       return;
//                                     }

//                                     controller.updateUser(
//                                       onSuccess: () {
//                                         showAwesomeDialog(
//                                           desc:
//                                               'Profil Anda berhasil diperbarui.',
//                                           onOkPressed: () =>
//                                               Get.backWithResult(result: true),
//                                         );
//                                       },
//                                       onFailure: () {
//                                         showAwesomeDialog(
//                                           type: DialogType.error,
//                                           title: 'Oops!',
//                                           desc:
//                                               'Terjadi kesalahan saat memperbarui profil. Silakan coba lagi.',
//                                         );
//                                       },
//                                     );
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//     );
//   }
// }

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';
import 'package:find_kajian/shared/util/dialog/show_awesome_dialog.dart';
import 'package:find_kajian/shared/util/validator/validator.dart';
import 'package:find_kajian/shared/widget/form/button/button.dart';
import 'package:find_kajian/shared/widget/form/date_picker/datepicker.dart';
import 'package:find_kajian/shared/widget/form/dropdown/dropdown.dart';
import 'package:find_kajian/shared/widget/form/textfield/text_field.dart';
import 'package:find_kajian/state_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../controller/update_profile_controller.dart';
import '../state/update_profile_state.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  UpdateProfileController controller = UpdateProfileController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (GetIt.I.isRegistered<UpdateProfileController>()) {
      GetIt.I.unregister<UpdateProfileController>();
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
      child: BlocListener<UpdateProfileController, UpdateProfileState>(
        listener: (context, state) {},
        child: BlocBuilder<UpdateProfileController, UpdateProfileState>(
          builder: (context, state) {
            final bloc = context.read<UpdateProfileController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    UpdateProfileController controller,
    UpdateProfileState state,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Edit Profil',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: state.isLoading
          ? Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(child: Text('Error: ${state.error}'))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Heading
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20, left: 24.0, right: 24.0),
                              child: Text(
                                "Edit Profil Anda",
                                style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 5.0,
                                left: 24.0,
                              ),
                              child: Text(
                                "Isi data diri anda.",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: secondaryTextColor),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // form login
                      Padding(
                        padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                QTextField(
                                  hint: 'Nama',
                                  validator: Validator.required,
                                  prefixIcon: Icons.person_rounded,
                                  value: state.userData["name"] ?? '',
                                  onChanged: (value) {
                                    state.userData["name"] = value;
                                  },
                                ),
                                const SizedBox(height: 18.0),
                                QTextField(
                                  hint: 'Email',
                                  validator: Validator.email,
                                  prefixIcon: Icons.email,
                                  value: state.userData["email"] ?? '',
                                  onChanged: (value) {
                                    state.userData["email"] = value;
                                    DBService.set('email', value);
                                  },
                                ),
                                const SizedBox(height: 18.0),
                                QTextField(
                                  hint: 'Nomor Telepon',
                                  validator: Validator.number,
                                  prefixIcon: Icons.phone,
                                  value: state.userData["nomor_wa"] ?? '',
                                  onChanged: (value) {
                                    state.userData["nomor_wa"] = value;
                                  },
                                ),
                                const SizedBox(height: 18.0),
                                // Date of Birth Field
                                QDatePicker(
                                  label: "Tanggal Lahir",
                                  value: DateTime.parse(
                                      state.userData["tgl_lahir"]),
                                  onChanged: (date) {
                                    state.userData["tgl_lahir"] =
                                        date.toString();
                                  },
                                ),
                                const SizedBox(
                                  height: 18.0,
                                ),
                                // Gender Field
                                QDropdownField(
                                  label: "Jenis Kelamin",
                                  items: [
                                    {
                                      'label': 'Laki-Laki',
                                      'value': 'Laki-Laki'
                                    },
                                    {
                                      'label': 'Perempuan',
                                      'value': 'Perempuan'
                                    },
                                  ],
                                  value: state.userData["jenis_kelamin"],
                                  onChanged: (value, label) {
                                    state.userData["jenis_kelamin"] = value;
                                  },
                                ),
                                const SizedBox(height: 18.0),
                                QTextField(
                                  hint: 'Alamat',
                                  validator: Validator.required,
                                  prefixIcon: Icons.location_on,
                                  value: state.userData["alamat"] ?? '',
                                  onChanged: (value) {
                                    state.userData["alamat"] = value;
                                  },
                                ),
                                const SizedBox(height: 18.0),
                                QTextField(
                                  hint: 'Pekerjaan',
                                  validator: Validator.required,
                                  prefixIcon: Icons.work,
                                  value: state.userData["pekerjaan"] ?? '',
                                  onChanged: (value) {
                                    state.userData["pekerjaan"] = value;
                                  },
                                ),
                                const SizedBox(height: 22.0),
                                QButton(
                                  label: "Simpan",
                                  color: tertiaryColor,
                                  onPressed: () {
                                    bool isValid =
                                        formKey.currentState!.validate();
                                    if (!isValid) {
                                      return;
                                    }

                                    controller.updateUser(
                                      onSuccess: () {
                                        showAwesomeDialog(
                                          desc:
                                              'Profil Anda berhasil diperbarui.',
                                          onOkPressed: () =>
                                              Get.backWithResult(result: true),
                                        );
                                      },
                                      onFailure: () {
                                        showAwesomeDialog(
                                          type: DialogType.error,
                                          title: 'Oops!',
                                          desc:
                                              'Terjadi kesalahan saat memperbarui profil. Silakan coba lagi.',
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
