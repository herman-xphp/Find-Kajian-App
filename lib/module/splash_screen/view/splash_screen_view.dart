import 'package:find_kajian/module/login/view/login_view.dart';
import 'package:find_kajian/module/main_navigation/view/main_navigation_view.dart';
import 'package:find_kajian/service/auth_service/auth_service.dart';
// import 'package:find_kajian/state_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/splash_screen_controller.dart';
import '../state/splash_screen_state.dart';
import 'package:get_it/get_it.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  SplashScreenController controller = SplashScreenController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<SplashScreenController>()) {
      GetIt.I.unregister<SplashScreenController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
    _navigateToNext();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _navigateToNext() async {
    await Future.delayed(Duration(seconds: 2), () async {
      if (await AuthService.isLoggedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainNavigationView()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<SplashScreenController, SplashScreenState>(
        listener: (context, state) {},
        child: BlocBuilder<SplashScreenController, SplashScreenState>(
          builder: (context, state) {
            final bloc = context.read<SplashScreenController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    SplashScreenController controller,
    SplashScreenState state,
  ) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset('assets/splash_image.png'),
        ),
      ),
    );
  }
}
