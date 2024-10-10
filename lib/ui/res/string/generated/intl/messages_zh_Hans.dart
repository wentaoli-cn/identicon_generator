// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hans locale. All the
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
  String get localeName => 'zh_Hans';

  static String m0(value) => "${value} × ${value}";

  static String m1(value) => "${value} px";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "advancedBackgroundColorLabel":
            MessageLookupByLibrary.simpleMessage("背景色"),
        "advancedColorBlueLabel": MessageLookupByLibrary.simpleMessage("蓝"),
        "advancedColorGreenLabel": MessageLookupByLibrary.simpleMessage("绿"),
        "advancedColorHelper":
            MessageLookupByLibrary.simpleMessage("生成的 Identicon 的颜色"),
        "advancedColorRedLabel": MessageLookupByLibrary.simpleMessage("红"),
        "advancedColorWarning":
            MessageLookupByLibrary.simpleMessage("填充色和背景色不能太过相似（或是相同）以便于区分。"),
        "advancedGridTypeDescription": m0,
        "advancedGridTypeHelper":
            MessageLookupByLibrary.simpleMessage("生成 Identicon 的网格类型"),
        "advancedHashFunctionHelper":
            MessageLookupByLibrary.simpleMessage("生成 Identicon 的哈希算法"),
        "advancedPixelColorLabel": MessageLookupByLibrary.simpleMessage("填充色"),
        "advancedRandomColorsLabel":
            MessageLookupByLibrary.simpleMessage("使用随机颜色？"),
        "advancedSizeDescription": m1,
        "advancedSizeHelper":
            MessageLookupByLibrary.simpleMessage("生成的 Identicon 的大小"),
        "advancedTitle": MessageLookupByLibrary.simpleMessage("高级选项"),
        "appName": MessageLookupByLibrary.simpleMessage("Identicon 生成器"),
        "homeAdvancedButtonText": MessageLookupByLibrary.simpleMessage("高级选项"),
        "homePromptsHelper": MessageLookupByLibrary.simpleMessage(
            "请勿使用敏感信息, 你的 Identicon 可能会泄露它。"),
        "homePromptsHint":
            MessageLookupByLibrary.simpleMessage("请在此输入用于生成 Identicon 的信息。"),
        "homeTitle": MessageLookupByLibrary.simpleMessage("Identicon 生成器")
      };
}
