import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_kajian/service/search_service/search_service.dart';
import '../state/search_kajian_state.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class SearchKajianController extends Cubit<SearchKajianState>
    implements IBlocBase {
  SearchKajianController() : super(SearchKajianState());

  @override
  void initState() {
    //initState event
    search('', type: 'kajian');
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  void selectKajian() async {
    emit(state.copyWith(isKajianSelected: true));
    await search('', type: 'kajian');
  }

  void selectTempatKajian() async {
    emit(state.copyWith(isKajianSelected: false, isLoading: true));
    await search('', type: 'tempat');
    print('sampai sini ka?');
  }

  Future<void> search(String query, {String? type}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final results = await SearchService().search(query, type: type);
      if (state.isKajianSelected == true) {
        state.kajianResults = results;
        emit(state.copyWith(isLoading: false));
      } else {
        state.tempatKajianResults = results;
        emit(state.copyWith(isLoading: false));
      }
    } catch (e) {
      emit(
          state.copyWith(isLoading: false, errorMessage: 'Error occurred: $e'));
    }
  }
}
