import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_kajian/service/ustadz_service/ustadz_service.dart';
import '../state/daftar_ustadz_state.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class DaftarUstadzController extends Cubit<DaftarUstadzState>
    implements IBlocBase {
  DaftarUstadzController() : super(DaftarUstadzState());

  @override
  void initState() {
    //initState event
    // getProducts();
    // searchUstadz('');
    search('');
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  // searchUstadz(String query) async {
  //   emit(state.copyWith(isLoading: true));
  //   try {
  //     var ustadz = await UstadzService(query).search();
  //     emit(state.copyWith(ustadzs: ustadz, isLoading: false));
  //   } catch (e) {
  //     emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
  //   }
  // }

  Future<void> search(String query) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      state.ustadzResults = await UstadzService().search(query);

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(
          state.copyWith(isLoading: false, errorMessage: 'Error occurred: $e'));
    }
  }
}
