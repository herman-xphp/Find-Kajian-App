import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:find_kajian/shared/util/dialog/show_awesome_dialog.dart';
import 'package:find_kajian/shared/util/validator/validator.dart';
import 'package:find_kajian/shared/widget/form/button/button.dart';
import 'package:find_kajian/shared/widget/form/textfield/text_field.dart';
import 'package:find_kajian/state_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../controller/register_controller.dart';
import '../state/register_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterController controller = RegisterController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscurePassword = true; // Menambahkan state untuk password visibility
  bool _obscureConfirmPassword =
      true; // Menambahkan state untuk password confirmation visibility

  @override
  void initState() {
    if (GetIt.I.isRegistered<RegisterController>()) {
      GetIt.I.unregister<RegisterController>();
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
      child: BlocListener<RegisterController, RegisterState>(
        listener: (context, state) {},
        child: BlocBuilder<RegisterController, RegisterState>(
          builder: (context, state) {
            final bloc = context.read<RegisterController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    RegisterController controller,
    RegisterState state,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Mengatur agar konten tidak naik
      appBar: AppBar(
        title: const Text(
          'Daftar',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Buat Akun Baru",
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Isi data diri anda.",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        // color: secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QTextField(
                      hint: 'Nama',
                      validator: Validator.required,
                      prefixIcon: Icons.person_rounded,
                      value: null,
                      onChanged: (value) {
                        state.name = value;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    QTextField(
                      hint: 'Email',
                      validator: Validator.email,
                      prefixIcon: Icons.email,
                      value: null,
                      onChanged: (value) {
                        state.email = value;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    QTextField(
                      hint: 'Nomor Wa',
                      validator: Validator.number,
                      prefixIcon: Icons.phone,
                      value: null,
                      onChanged: (value) {
                        state.phone = value;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    // Password Field with Show/Hide
                    TextFormField(
                      obscureText: _obscurePassword,
                      obscuringCharacter: '•',
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: secondaryTextColor),
                        prefixIcon: Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: secondaryTextColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: Validator.required,
                      onChanged: (value) {
                        state.password = value;
                      },
                    ),
                    const SizedBox(height: 22.0),
                    TextFormField(
                      obscureText: _obscureConfirmPassword,
                      obscuringCharacter: '•',
                      decoration: InputDecoration(
                        hintText: 'Konfirmasi Password',
                        hintStyle: TextStyle(color: secondaryTextColor),
                        prefixIcon: Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: secondaryTextColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                      validator: Validator.required,
                      onChanged: (value) {
                        state.confirm_password = value;
                      },
                    ),
                    const SizedBox(height: 30.0),
                    Center(
                      child: QButton(
                        label: "Daftar",
                        color: tertiaryColor,
                        onPressed: () {
                          bool isValid = formKey.currentState!.validate();
                          if (!isValid) {
                            return;
                          }

                          controller.register(
                            onSuccess: () {
                              showAwesomeDialog(
                                title: 'Sukses',
                                desc:
                                    'Akun Anda berhasil dibuat. \nSelamat bergabung!',
                                onOkPressed: () {
                                  Get.back();
                                },
                              );
                            },
                            onFailure: () {
                              showAwesomeDialog(
                                type: DialogType.error,
                                title: 'Oops!',
                                desc:
                                    'Terjadi kesalahan saat membuat akun. \nSilakan coba lagi.',
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
