import 'dart:ui';

import 'package:find_kajian/service/detail_kajian_service/detail_kajian_service.dart';
import 'package:find_kajian/service/user_service/user_service.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';
import 'package:find_kajian/shared/util/show_loading/show_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/detail_kajian_state.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class DetailKajianController extends Cubit<DetailKajianState>
    implements IBlocBase {
  DetailKajianController() : super(DetailKajianState());

  @override
  void initState() {
    //initState event
    late final id = DBService.get("kajian_id");
    fetchUserData();
    getKajian(id!);
    getReviewByKajianId(id);
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  Future<void> getKajian(String id) async {
    // emit(state.copyWith(isLoading: true));
    try {
      Map<String, dynamic> kajian = await DetailKajianService().showKajian(id);
      if (!kajian.isEmpty) {
        emit(state.copyWith(kajianData: kajian));
      } else {
        emit(state.copyWith(kajianData: {}));
      }
    } catch (e) {
      print(e);
      // Tangani kesalahan jika diperlukan
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> getReviewByKajianId(String id) async {
    emit(state.copyWith(isLoading: true));
    try {
      final List result =
          await DetailKajianService().getKajianReviewByKajianId(id);

      if (result.isEmpty) {
        emit(state.copyWith(reviews: [], isLoading: false));
      } else {
        emit(state.copyWith(reviews: result, isLoading: false));
      }
    } catch (e) {
      print(e);
      // Tangani kesalahan jika diperlukan
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> fetchUserData() async {
    try {
      // Set loading to true
      emit(state.copyWith(isLoading: true));

      final userData = await UserService().getCurrentUser();

      if (userData != null) {
        // Memperbarui state dengan data pengguna yang diambil dan set loading ke false
        emit(state.copyWith(isLoading: false, userData: userData));
      } else {
        emit(state.copyWith(
            isLoading: false, error: "Failed to fetch user data."));
      }
    } catch (error) {
      // Handle error and set loading to false
      emit(state.copyWith(isLoading: false, error: error.toString()));
    }
  }

  Future<void> saveUlasan({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    try {
      showLoading();
      bool success = await DetailKajianService().save(
        kajianId: state.kajianData["kajian_id"],
        userId: state.userData["id"],
        content: state.content!,
      );
      hideLoading();

      if (success == true) {
        print('berhasil');
        onSuccess();
      } else {
        print('gagal');
        onFailure();
      }
    } catch (e) {
      emit(state.copyWith(error: 'Gagal memperbarui data pengguna: $e'));
      print('di sini kah? $e');
      onFailure();
    }
  }

  Future<void> editUlasan({
    required int reviewId,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    try {
      showLoading();
      bool success = await DetailKajianService().update(
        reviewId: reviewId,
        content: state.content!,
      );
      hideLoading();

      if (success == true) {
        print('berhasil');
        onSuccess();
      } else {
        print('gagal');
        onFailure();
      }
    } catch (e) {
      emit(state.copyWith(error: 'Gagal memperbarui data pengguna: $e'));
      print('di sini kah? $e');
      onFailure();
    }
  }

  Future<void> deleteReview({
    required int reviewId,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    try {
      showLoading();
      bool success = await DetailKajianService().delete(reviewId: reviewId);
      hideLoading();
      if (success) {
        // Berhasil menghapus review
        print('berhasil');
        onSuccess();
      } else {
        // Gagal menghapus review
        print('gagal');
        onFailure();
      }
    } catch (error) {
      print("Error in hapusReview: $error");
      emit(state.copyWith(error: 'Gagal memperbarui data pengguna: $error'));
      onFailure();
    }
  }
}
