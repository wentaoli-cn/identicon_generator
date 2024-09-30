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

  /// `Advanced`
  String get homeAdvancedButtonText {
    return Intl.message(
      'Advanced',
      name: 'homeAdvancedButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advancedTitle {
    return Intl.message(
      'Advanced',
      name: 'advancedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hash function`
  String get advancedHashFunctionHelper {
    return Intl.message(
      'Hash function',
      name: 'advancedHashFunctionHelper',
      desc: '',
      args: [],
    );
  }

  /// `Grid type`
  String get advancedGridTypeHelper {
    return Intl.message(
      'Grid type',
      name: 'advancedGridTypeHelper',
      desc: '',
      args: [],
    );
  }

  /// `{value} × {value}`
  String advancedGridTypeDescription(Object value) {
    return Intl.message(
      '$value × $value',
      name: 'advancedGridTypeDescription',
      desc: '',
      args: [value],
    );
  }

  /// `Size`
  String get advancedSizeHelper {
    return Intl.message(
      'Size',
      name: 'advancedSizeHelper',
      desc: '',
      args: [],
    );
  }

  /// `{value} px`
  String advancedSizeDescription(Object value) {
    return Intl.message(
      '$value px',
      name: 'advancedSizeDescription',
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
