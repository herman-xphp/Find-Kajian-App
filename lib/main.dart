import 'package:find_kajian/module/splash_screen/view/splash_screen_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:find_kajian/injection.dart';
import 'package:find_kajian/shared/theme/theme.dart';
import 'package:find_kajian/shared/theme/theme_dark.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';
import 'package:find_kajian/state_util.dart';
import 'package:find_kajian/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await DBService.init();
  runMainApp();
}

runMainApp() async {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        // Tambahkan BlocProvider lain di sini jika diperlukan
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        print('Current ThemeMode: ${themeState.isDarkMode ? "Dark" : "Light"}');
        return MaterialApp(
          title: 'Find Kajian',
          navigatorKey: Get.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: getDefaultTheme(),
          darkTheme: getDarkTheme(),
          themeMode: themeState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: SplashScreenView(),
        );
      },
    );
  }
}
