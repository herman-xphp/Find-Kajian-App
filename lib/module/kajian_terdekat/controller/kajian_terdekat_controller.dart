import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:find_kajian/service/kajian_service/kajian_service.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';
import '../state/kajian_terdekat_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class KajianTerdekatController extends Cubit<KajianTerdekatState>
    implements IBlocBase {
  KajianTerdekatController() : super(KajianTerdekatState());

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
      // Tambahkan delay di sini jika diperlukan
      // await Future.delayed(Duration(seconds: 10)); // Menunda selama 2 detik

      String? latitude = await DBService.get("latitude");
      String? longitude = await DBService.get("longitude");

      state.fullAddress = await DBService.get("fullAddress");
      state.products = await KajianService(latitude!, longitude!).get();

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      // Tangani kesalahan jika diperlukan
      throw e;
    }
  }
}
