import 'package:identicon_generator/data/repositories/icon_settings_repository.dart';
import 'package:identicon_generator/ui/screens/common/blocs/icon/icon_bloc.dart';

class GetIconSettingsUseCase {
  const GetIconSettingsUseCase({required this.settingsRepository});

  final IconSettingsRepository settingsRepository;

  IconState execute() => settingsRepository.getIconSettings();
}
