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
    getCurrentLocationWithKajianData();
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  // int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  Future<void> refreshLocation() async {
    print('refresh');
    state.address = null;
    emit(state.copyWith());
    await LocationService().saveCurrentLocationWithAddress();
    getCurrentLocationWithKajianData();
    // state.address = await DBService.get("address");
    // emit(state.copyWith());
  }

  getCurrentLocationWithKajianData() async {
    emit(state.copyWith(isLoading: true));
    try {
      await LocationService().saveCurrentLocationWithAddress();

      String? latitude = await DBService.get("latitude");
      String? longitude = await DBService.get("longitude");

      state.address = await DBService.get("address");
      state.products = await HomeService(latitude!, longitude!).get();

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      print(e);
      emit(state.copyWith(isLoading: false));
    }
  }
}
