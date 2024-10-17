import 'package:identicon_generator/data/repositories/icon_settings_repository.dart';
import 'package:identicon_generator/ui/screens/common/blocs/icon/icon_bloc.dart';

class SaveIconSettingsUseCase {
  const SaveIconSettingsUseCase({required this.settingsRepository});

  final IconSettingsRepository settingsRepository;

  void execute(IconState value) => settingsRepository.saveIconSettings(value);
}
