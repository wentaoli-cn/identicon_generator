import 'package:identicon_generator/data/datasources/local/icon_settings_datasource.dart';
import 'package:identicon_generator/ui/screens/common/blocs/icon_bloc.dart';

class IconSettingsRepository {
  const IconSettingsRepository({required this.prefsDataSource});

  final IconSettingsDataSource prefsDataSource;

  void saveIconSettings(IconState value) =>
      prefsDataSource.saveIconSettings(value);

  IconState getIconSettings() => prefsDataSource.getIconSettings();
}
