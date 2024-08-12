import 'package:find_kajian/bloc_util.dart';
import 'package:find_kajian/service/user_service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:find_kajian/service/auth_service/auth_service.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';

import '../state/profile_state.dart';

@singleton
class ProfileController extends Cubit<ProfileState> implements IBlocBase {
  ProfileController() : super(ProfileState());

  @override
  void initState() {
    //initState event
    getCurrentUser();
    _loadAppVersion();
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  logout() async {
    await AuthService().logout();
  }

  void shareLink() {
    Share.share(
        'Segera, Install Find Kajian Aplikasi Pencari Kajian Sunnah berdasarkan jarak terdekat. \nLink: https://app.mediafire.com/erj9zif7he23x');
  }

  void getCurrentUser() async {
    Map<String, dynamic>? userData = await UserService().getCurrentUser();
    if (userData == null || userData.isEmpty) {
      emit(state.copyWith(userData: {}));
    } else {
      emit(state.copyWith(userData: userData));
    }
  }

  Future<void> _loadAppVersion() async {
    emit(state.copyWith(isLoading: true));
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      emit(state.copyWith(version: packageInfo.version, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
