import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_kajian/service/tempat_kajian_service/tempat_kajian_service.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';
import '../state/masjid_terdekat_state.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class MasjidTerdekatController extends Cubit<MasjidTerdekatState>
    implements IBlocBase {
  MasjidTerdekatController() : super(MasjidTerdekatState());

  @override
  void initState() {
    //initState event
    getCurrentLocationWithAddress();
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  Future<void> refreshData() async {
    emit(state.copyWith(isLoading: true));
    await getCurrentLocationWithAddress();
  }

  getCurrentLocationWithAddress() async {
    try {
      String? latitude = await DBService.get("latitude");
      String? longitude = await DBService.get("longitude");

      state.fullAddress = await DBService.get("fullAddress");
      state.products = await TempatKajianService(latitude!, longitude!).get();
      print('masuk sini');

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      // Tangani kesalahan jika diperlukan
      emit(state.copyWith(isLoading: false));
    }
  }
}
