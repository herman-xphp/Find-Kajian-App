import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_kajian/module/home/widget/home_heading.dart';
import 'package:find_kajian/module/home/widget/home_kajian_terbaru.dart';
import 'package:find_kajian/module/home/widget/home_location_date.dart';
import 'package:find_kajian/module/home/widget/home_menu.dart';
import 'package:find_kajian/module/home/widget/home_rekomendasi.dart';
import '../controller/home_controller.dart';
import '../state/home_state.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<HomeController>()) {
      GetIt.I.unregister<HomeController>();
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
      child: BlocListener<HomeController, HomeState>(
        listener: (context, state) {},
        child: BlocBuilder<HomeController, HomeState>(
          builder: (context, state) {
            final bloc = context.read<HomeController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    HomeController controller,
    HomeState state,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeLocationDate(),

              HomeHeading(),

              // Menu
              HomeMenu(),

              // Rekomendasi Tempat Kajian
              HomeRekomendasi(),

              // Kajian Terbaru
              HomeKajianTerbaru(),
            ],
          ),
        ),
      ),
    );
  }
}
