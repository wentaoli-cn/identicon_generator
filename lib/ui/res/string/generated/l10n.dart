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

  /// `An identicon is a visual representation of a hash value.`
  String get homeExplanation {
    return Intl.message(
      'An identicon is a visual representation of a hash value.',
      name: 'homeExplanation',
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

  /// `Hash function used to generate`
  String get homeHashFunctionHelper {
    return Intl.message(
      'Hash function used to generate',
      name: 'homeHashFunctionHelper',
      desc: '',
      args: [],
    );
  }

  /// `Grid type used to generate`
  String get homeGridTypeHelper {
    return Intl.message(
      'Grid type used to generate',
      name: 'homeGridTypeHelper',
      desc: '',
      args: [],
    );
  }

  /// `{value} × {value}`
  String homeGridTypeDescription(Object value) {
    return Intl.message(
      '$value × $value',
      name: 'homeGridTypeDescription',
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
