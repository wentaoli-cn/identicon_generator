import 'package:get_it/get_it.dart';
import 'package:identicon_generator/data/datasources/local/icon_settings_datasource.dart';
import 'package:identicon_generator/data/repositories/icon_settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  getIt.registerLazySingletonAsync(
    () => SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: {IconSettingsDataSource.iconSettingKey},
      ),
    ),
  );
  await getIt.isReady<SharedPreferencesWithCache>();
  getIt.registerLazySingleton(() => IconSettingsDataSource(
        prefs: getIt(),
      ));
  getIt.registerLazySingleton(() => IconSettingsRepository(
        prefsDataSource: getIt(),
      ));
}
