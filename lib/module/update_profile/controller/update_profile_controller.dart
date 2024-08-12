import 'dart:ui';
import 'package:find_kajian/service/user_service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_kajian/bloc_util.dart';
import 'package:injectable/injectable.dart';

import '../state/update_profile_state.dart';

@singleton
class UpdateProfileController extends Cubit<UpdateProfileState>
    implements IBlocBase {
  UpdateProfileController() : super(UpdateProfileState());

  @override
  void initState() {
    //initState event
    fetchUserData();
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
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

  Future<void> updateUser({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    try {
      bool success = await UserService().updateCurrentUser(
        name: state.userData["name"],
        email: state.userData["email"],
        phone: state.userData["nomor_wa"],
        gender: state.userData["jenis_kelamin"],
        dateOfBirth: state.userData["tgl_lahir"],
        address: state.userData["alamat"],
        occupation: state.userData["pekerjaan"],
      );

      if (success) {
        onSuccess();
      } else {
        onFailure();
      }
    } catch (e) {
      emit(state.copyWith(error: 'Gagal memperbarui data pengguna: $e'));
      onFailure();
    }
  }
}
