import 'package:identicon_generator/data/di/get_it.dart';
import 'package:identicon_generator/domain/usecases/get_icon_settings_usecase.dart';
import 'package:identicon_generator/domain/usecases/save_icon_settings_usecase.dart';

class UseCaseProvider {
  static SaveIconSettingsUseCase provideSaveIconSettingsUseCase() =>
      SaveIconSettingsUseCase(settingsRepository: getIt());

  static GetIconSettingsUseCase provideGetIconSettingsUseCase() =>
      GetIconSettingsUseCase(settingsRepository: getIt());
}
