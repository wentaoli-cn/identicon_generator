// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Identicon Generator`
  String get appName {
    return Intl.message(
      'Identicon Generator',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Identicon Generator`
  String get homeTitle {
    return Intl.message(
      'Identicon Generator',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your prompts here.`
  String get homePromptsHint {
    return Intl.message(
      'Please enter your prompts here.',
      name: 'homePromptsHint',
      desc: '',
      args: [],
    );
  }

  /// `Do not use sensitive information, your identicon may reveal it.`
  String get homePromptsHelper {
    return Intl.message(
      'Do not use sensitive information, your identicon may reveal it.',
      name: 'homePromptsHelper',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get homeSettingsButtonText {
    return Intl.message(
      'Settings',
      name: 'homeSettingsButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Saved!`
  String get homeSavedSnackBarText {
    return Intl.message(
      'Saved!',
      name: 'homeSavedSnackBarText',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get homeSavedSnackBarActionText {
    return Intl.message(
      'Gallery',
      name: 'homeSavedSnackBarActionText',
      desc: '',
      args: [],
    );
  }

  /// `identicon`
  String get homeSavedIconName {
    return Intl.message(
      'identicon',
      name: 'homeSavedIconName',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hash function`
  String get settingsHashFunctionHelper {
    return Intl.message(
      'Hash function',
      name: 'settingsHashFunctionHelper',
      desc: '',
      args: [],
    );
  }

  /// `Grid type`
  String get settingsGridTypeHelper {
    return Intl.message(
      'Grid type',
      name: 'settingsGridTypeHelper',
      desc: '',
      args: [],
    );
  }

  /// `{value} × {value}`
  String settingsGridTypeDescription(Object value) {
    return Intl.message(
      '$value × $value',
      name: 'settingsGridTypeDescription',
      desc: '',
      args: [value],
    );
  }

  /// `Size`
  String get settingsSizeHelper {
    return Intl.message(
      'Size',
      name: 'settingsSizeHelper',
      desc: '',
      args: [],
    );
  }

  /// `{value} px`
  String settingsSizeDescription(Object value) {
    return Intl.message(
      '$value px',
      name: 'settingsSizeDescription',
      desc: '',
      args: [value],
    );
  }

  /// `Color`
  String get settingsColorHelper {
    return Intl.message(
      'Color',
      name: 'settingsColorHelper',
      desc: '',
      args: [],
    );
  }

  /// `Random color?`
  String get settingsRandomColorsLabel {
    return Intl.message(
      'Random color?',
      name: 'settingsRandomColorsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Pixel color`
  String get settingsPixelColorLabel {
    return Intl.message(
      'Pixel color',
      name: 'settingsPixelColorLabel',
      desc: '',
      args: [],
    );
  }

  /// `Background color`
  String get settingsBackgroundColorLabel {
    return Intl.message(
      'Background color',
      name: 'settingsBackgroundColorLabel',
      desc: '',
      args: [],
    );
  }

  /// `R - {value}`
  String settingsColorRedLabel(Object value) {
    return Intl.message(
      'R - $value',
      name: 'settingsColorRedLabel',
      desc: '',
      args: [value],
    );
  }

  /// `G - {value}`
  String settingsColorGreenLabel(Object value) {
    return Intl.message(
      'G - $value',
      name: 'settingsColorGreenLabel',
      desc: '',
      args: [value],
    );
  }

  /// `B - {value}`
  String settingsColorBlueLabel(Object value) {
    return Intl.message(
      'B - $value',
      name: 'settingsColorBlueLabel',
      desc: '',
      args: [value],
    );
  }

  /// `Pixel color and background color should not be too similar (or the same) in order to distinguish them easily.`
  String get settingsColorWarning {
    return Intl.message(
      'Pixel color and background color should not be too similar (or the same) in order to distinguish them easily.',
      name: 'settingsColorWarning',
      desc: '',
      args: [],
    );
  }

  /// `#`
  String get settingsColorHashLabel {
    return Intl.message(
      '#',
      name: 'settingsColorHashLabel',
      desc: '',
      args: [],
    );
  }

  /// `Margin ratio`
  String get settingsMarginHelper {
    return Intl.message(
      'Margin ratio',
      name: 'settingsMarginHelper',
      desc: '',
      args: [],
    );
  }

  /// `{value} %`
  String settingsMarginDescription(Object value) {
    return Intl.message(
      '$value %',
      name: 'settingsMarginDescription',
      desc: '',
      args: [value],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
