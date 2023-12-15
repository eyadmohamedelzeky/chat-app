import 'package:chat_app/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
extension LocalizedStrings on BuildContext {
  /// Returns single instance of [AppLocalizations]
  /// Used instead of accessing and importing AppLocalizations at every page
  AppLocalization get localization => AppLocalization.of(this);
}