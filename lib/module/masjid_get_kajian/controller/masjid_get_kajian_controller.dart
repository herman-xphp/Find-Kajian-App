import 'package:find_kajian/bloc_util.dart';
import 'package:find_kajian/service/masjid_kajian_service/masjid_kajian_service.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../state/masjid_get_kajian_state.dart';

@singleton
class MasjidGetKajianController extends Cubit<MasjidGetKajianState>
    implements IBlocBase {
  MasjidGetKajianController() : super(MasjidGetKajianState());

  @override
  void initState() {
    //initState event
    var id = DBService.get("masjid_id");
    // emit(state.copyWith(isLoading: false));
    getCurrentMasjid(id!);
    getKajianByMasjidId(id);
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
    await getKajianByMasjidId(state.masjidData["id"].toString());
  }

  Future<void> getCurrentMasjid(String id) async {
// emit(state.copyWith(isLoading: true));
    try {
      Map<String, dynamic>? masjidData =
          await MasjidKajianService().getCurrent(id);
      if (masjidData!.isEmpty) {
        emit(state.copyWith(isLoading: false, masjidData: {}));
      } else {
        emit(state.copyWith(isLoading: false, masjidData: masjidData));
      }
    } catch (e) {
      print(e);
      // Tangani kesalahan jika diperlukan
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> getKajianByMasjidId(String id) async {
    emit(state.copyWith(isLoading: true));
    try {
      final kajianData = await MasjidKajianService().getById(id);
      // print(kajianData);

      emit(state.copyWith(isLoading: false, kajianData: kajianData));
    } catch (e) {
      print(e);
      // Tangani kesalahan jika diperlukan
      emit(state.copyWith(isLoading: false, kajianData: []));
    }
  }
}
