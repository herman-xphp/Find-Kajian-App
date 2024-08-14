import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_kajian/service/home_service/home_service.dart';
import 'package:find_kajian/service/location_service/location_service.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';
import '../state/home_state.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeController extends Cubit<HomeState> implements IBlocBase {
  HomeController() : super(HomeState());

  @override
  void initState() {
    //initState event
    init();
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  final CarouselController carouselController = CarouselController();

  Future<void> refreshData() async {
    emit(state.copyWith(isLoading: true));
    await getTopTempatKajian();
    await getLatestKajian();
  }

  Future<void> refreshLocation() async {
    state.address = null;

    emit(state.copyWith());

    await LocationService().saveCurrentLocationWithAddress();

    state.address = await DBService.get("address");

    emit(state.copyWith());
  }

  Future<void> init() async {
    state.address = null;

    emit(state.copyWith());

    await LocationService().saveCurrentLocationWithAddress();
    await getTopTempatKajian();
    await getLatestKajian();

    state.address = await DBService.get("address");

    emit(state.copyWith());
  }

  Future<void> getLatestKajian() async {
    emit(state.copyWith(isLoading: true));
    try {
      state.latestKajian = await HomeService().latestKajian();

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      print(e);
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> getTopTempatKajian() async {
    try {
      state.topTempatKajian = await HomeService().get();

      emit(state.copyWith());
    } catch (e) {
      print(e);
      emit(state.copyWith());
    }
  }
}
