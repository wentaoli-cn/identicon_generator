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
        "appName": MessageLookupByLibrary.simpleMessage("Identicon 生成器"),
        "homeExplanation":
            MessageLookupByLibrary.simpleMessage("Identicon 是哈希值的一种可视化表示。"),
        "homeGridTypeDescription": m0,
        "homeGridTypeHelper": MessageLookupByLibrary.simpleMessage("用于生成的网格类型"),
        "homeHashFunctionHelper":
            MessageLookupByLibrary.simpleMessage("用于生成的哈希算法"),
        "homeIconSizeDescription": m1,
        "homeIconSizeHelper": MessageLookupByLibrary.simpleMessage("用于生成的图标大小"),
        "homePromptsHelper": MessageLookupByLibrary.simpleMessage(
            "请勿使用敏感信息, 你的 Identicon 可能会泄露它。"),
        "homePromptsHint": MessageLookupByLibrary.simpleMessage("请在此处输入你的信息。")
      };
}
