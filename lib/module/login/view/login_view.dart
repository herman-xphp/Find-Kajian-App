import 'package:find_kajian/shared/util/db_service/db_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:find_kajian/module/forget_password/view/forget_password_view.dart';
import 'package:find_kajian/module/main_navigation/view/main_navigation_view.dart';
import 'package:find_kajian/module/register/view/register_view.dart';

import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:find_kajian/shared/util/dialog/show_awesome_dialog.dart';
import 'package:find_kajian/shared/util/validator/validator.dart';
import 'package:find_kajian/shared/widget/form/button/button.dart';
import 'package:find_kajian/shared/widget/form/textfield/text_field.dart';
import 'package:find_kajian/state_util.dart';

import '../controller/login_controller.dart';
import '../state/login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscurePassword = true; // Menambahkan state untuk password visibility

  @override
  void initState() {
    if (GetIt.I.isRegistered<LoginController>()) {
      GetIt.I.unregister<LoginController>();
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
      child: BlocListener<LoginController, LoginState>(
        listener: (context, state) {},
        child: BlocBuilder<LoginController, LoginState>(
          builder: (context, state) {
            final bloc = context.read<LoginController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    LoginController controller,
    LoginState state,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Mengatur agar konten tidak naik
      appBar: AppBar(
        title: Text(
          "Find Kajian",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Heading
            Container(
              // color: Colors.amber,
              margin: const EdgeInsets.fromLTRB(28, 65, 28, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Assalamu'alaikum,",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: secondaryTextColor),
                  ),
                  Text(
                    "Ahlan wa Sahlan.",
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),

            // form login
            Expanded(
              child: Container(
                // color: Colors.blue,
                margin: EdgeInsets.fromLTRB(28, 30, 28, 0),
                child: Form(
                  key: formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      QTextField(
                        hint: 'Email',
                        validator: Validator.email,
                        prefixIcon: Icons.email,
                        prefixIconColor: Colors.amber,
                        value: state.email == null ? '' : state.email,
                        onChanged: (value) {
                          state.email = value;
                          DBService.set('email', value);
                          print('berhasil set email');
                        },
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      // Password Field with Show/Hide
                      TextFormField(
                        obscureText: _obscurePassword,
                        obscuringCharacter: '•',
                        // style: TextStyle(color: textColor),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: secondaryTextColor),
                          prefixIcon: Icon(Icons.password_rounded),
                          prefixIconColor: secondaryTextColor,
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
                      const SizedBox(
                        height: 22.0,
                      ),
                      QButton(
                        label: "Login",
                        color: tertiaryColor,
                        onPressed: () {
                          bool isValid = formKey.currentState!.validate();
                          if (!isValid) {
                            return;
                          }
                          controller.login(
                            onSuccess: () {
                              Get.offAll(MainNavigationView());
                            },
                            onFailure: () {
                              showAwesomeDialog(
                                type: DialogType.error,
                                title: 'Oops!',
                                desc:
                                    'Email atau kata sandi yang Anda masukkan tidak cocok. Silakan coba lagi.',
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // Lupa password
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ForgetPasswordView());
                          },
                          child: Text(
                            "Lupa Password?",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                              // color: textColor,
                              color: secondaryTextColor,
                              // color: Color(0xff475D6D),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Register
            Padding(
              padding: const EdgeInsets.only(bottom: 26.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum Punya Akun?",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                            // color: textColor,
                            color: secondaryTextColor,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Daftar",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            // letterSpacing: 1.0,
                            // color: Color(0xff475D6D),
                            color: tertiaryColor,
                          ),
                        ),
                      ],
                    ),
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
