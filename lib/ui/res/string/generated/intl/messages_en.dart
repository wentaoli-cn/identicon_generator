// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(value) => "B - ${value}";

  static String m1(value) => "G - ${value}";

  static String m2(value) => "R - ${value}";

  static String m3(value) => "${value} × ${value}";

  static String m4(value) => "${value} %";

  static String m5(value) => "${value} px";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Identicon Generator"),
        "homePromptsHelper": MessageLookupByLibrary.simpleMessage(
            "Do not use sensitive information, your identicon may reveal it."),
        "homePromptsHint": MessageLookupByLibrary.simpleMessage(
            "Please enter your prompts here."),
        "homeSavedIconName": MessageLookupByLibrary.simpleMessage("identicon"),
        "homeSavedSnackBarActionText":
            MessageLookupByLibrary.simpleMessage("Gallery"),
        "homeSavedSnackBarText": MessageLookupByLibrary.simpleMessage("Saved!"),
        "homeSettingsButtonText":
            MessageLookupByLibrary.simpleMessage("Settings"),
        "homeTitle":
            MessageLookupByLibrary.simpleMessage("Identicon Generator"),
        "settingsBackgroundColorLabel":
            MessageLookupByLibrary.simpleMessage("Background color"),
        "settingsColorBlueLabel": m0,
        "settingsColorGreenLabel": m1,
        "settingsColorHashLabel": MessageLookupByLibrary.simpleMessage("#"),
        "settingsColorHelper": MessageLookupByLibrary.simpleMessage("Color"),
        "settingsColorRedLabel": m2,
        "settingsColorWarning": MessageLookupByLibrary.simpleMessage(
            "Pixel color and background color should not be too similar (or the same) in order to distinguish them easily."),
        "settingsGridTypeDescription": m3,
        "settingsGridTypeHelper":
            MessageLookupByLibrary.simpleMessage("Grid type"),
        "settingsHashFunctionHelper":
            MessageLookupByLibrary.simpleMessage("Hash function"),
        "settingsMarginDescription": m4,
        "settingsMarginHelper":
            MessageLookupByLibrary.simpleMessage("Margin ratio"),
        "settingsPixelColorLabel":
            MessageLookupByLibrary.simpleMessage("Pixel color"),
        "settingsRandomColorsLabel":
            MessageLookupByLibrary.simpleMessage("Random color?"),
        "settingsSizeDescription": m5,
        "settingsSizeHelper": MessageLookupByLibrary.simpleMessage("Size"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings")
      };
}
