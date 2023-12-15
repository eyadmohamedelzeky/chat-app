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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "already_have_account":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "chat_app": MessageLookupByLibrary.simpleMessage("Chat App"),
        "donnot_have_account":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "email_empty":
            MessageLookupByLibrary.simpleMessage("Please Enter Your Email"),
        "forgot_password":
            MessageLookupByLibrary.simpleMessage("Forget Password"),
        "go_back": MessageLookupByLibrary.simpleMessage("Go Back"),
        "hint_email": MessageLookupByLibrary.simpleMessage("Enter Your Email"),
        "hint_message": MessageLookupByLibrary.simpleMessage("Message"),
        "hint_password":
            MessageLookupByLibrary.simpleMessage("Enter Your Password"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "messages": MessageLookupByLibrary.simpleMessage("messages"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_empty":
            MessageLookupByLibrary.simpleMessage("Please Enter Your Password"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "reset_password":
            MessageLookupByLibrary.simpleMessage("Reset Password"),
        "short_password":
            MessageLookupByLibrary.simpleMessage("Password Too Short")
      };
}
