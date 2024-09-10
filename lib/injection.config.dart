// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'module/daftar_ustadz/controller/daftar_ustadz_controller.dart' as _i832;
import 'module/detail_kajian/controller/detail_kajian_controller.dart' as _i801;
import 'module/forget_password/controller/forget_password_controller.dart'
    as _i1014;
import 'module/home/controller/home_controller.dart' as _i533;
import 'module/kajian_terdekat/controller/kajian_terdekat_controller.dart'
    as _i811;
import 'module/login/controller/login_controller.dart' as _i405;
import 'module/main_navigation/controller/main_navigation_controller.dart'
    as _i164;
import 'module/masjid_get_kajian/controller/masjid_get_kajian_controller.dart'
    as _i112;
import 'module/masjid_terdekat/controller/masjid_terdekat_controller.dart'
    as _i314;
import 'module/privacy_policy/controller/privacy_policy_controller.dart'
    as _i126;
import 'module/profile/controller/profile_controller.dart' as _i913;
import 'module/register/controller/register_controller.dart' as _i305;
import 'module/search_kajian/controller/search_kajian_controller.dart'
    as _i1006;
import 'module/splash_screen/controller/splash_screen_controller.dart' as _i670;
import 'module/terms_conditions/controller/terms_conditions_controller.dart'
    as _i840;
import 'module/update_profile/controller/update_profile_controller.dart'
    as _i831;
import 'module/ustadz_get_kajian/controller/ustadz_get_kajian_controller.dart'
    as _i119;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i832.DaftarUstadzController>(
        () => _i832.DaftarUstadzController());
    gh.singleton<_i1014.ForgetPasswordController>(
        () => _i1014.ForgetPasswordController());
    gh.singleton<_i533.HomeController>(() => _i533.HomeController());
    gh.singleton<_i811.KajianTerdekatController>(
        () => _i811.KajianTerdekatController());
    gh.singleton<_i405.LoginController>(() => _i405.LoginController());
    gh.singleton<_i164.MainNavigationController>(
        () => _i164.MainNavigationController());
    gh.singleton<_i112.MasjidGetKajianController>(
        () => _i112.MasjidGetKajianController());
    gh.singleton<_i314.MasjidTerdekatController>(
        () => _i314.MasjidTerdekatController());
    gh.singleton<_i126.PrivacyPolicyController>(
        () => _i126.PrivacyPolicyController());
    gh.singleton<_i913.ProfileController>(() => _i913.ProfileController());
    gh.singleton<_i305.RegisterController>(() => _i305.RegisterController());
    gh.singleton<_i1006.SearchKajianController>(
        () => _i1006.SearchKajianController());
    gh.singleton<_i670.SplashScreenController>(
        () => _i670.SplashScreenController());
    gh.singleton<_i840.TermsConditionsController>(
        () => _i840.TermsConditionsController());
    gh.singleton<_i831.UpdateProfileController>(
        () => _i831.UpdateProfileController());
    gh.singleton<_i119.UstadzGetKajianController>(
        () => _i119.UstadzGetKajianController());
    gh.singleton<_i801.DetailKajianController>(
        () => _i801.DetailKajianController());
    return this;
  }
}
