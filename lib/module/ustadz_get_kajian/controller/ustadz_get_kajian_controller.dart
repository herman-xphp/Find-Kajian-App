import 'package:find_kajian/service/ustadz_kajian_service/ustadz_kajian_service.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/ustadz_get_kajian_state.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class UstadzGetKajianController extends Cubit<UstadzGetKajianState>
    implements IBlocBase {
  UstadzGetKajianController() : super(UstadzGetKajianState());

  @override
  void initState() {
    //initState event
    var id = DBService.get("ustadz_id");
    getCurrentUstadz(id!);
    getKajianByUstadzId(id);
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  Future<void> getCurrentUstadz(String id) async {
// emit(state.copyWith(isLoading: true));
    try {
      final UstadzData = await UstadzKajianService().getCurrent(id);

      if (UstadzData == null || UstadzData.isEmpty) {
        emit(state.copyWith(isLoading: false, ustadzData: {}));
      } else {
        emit(state.copyWith(isLoading: false, ustadzData: UstadzData));
      }
    } catch (e) {
      print(e);
      // Tangani kesalahan jika diperlukan
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<bool> getKajianByUstadzId(String id) async {
    emit(state.copyWith(isLoading: true));
    try {
      final kajianData = await UstadzKajianService().getById(id);
      print('masuk sini');

      emit(state.copyWith(isLoading: false, kajianData: kajianData));
      return true;
    } catch (e) {
      print(e);
      // Tangani kesalahan jika diperlukan
      emit(state.copyWith(isLoading: false, kajianData: []));
      return false;
    }
  }
}
