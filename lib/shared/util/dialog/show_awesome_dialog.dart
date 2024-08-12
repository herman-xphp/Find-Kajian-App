import 'package:find_kajian/state_util.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';

Future<void> showAwesomeDialog({
  String? title,
  required String desc,
  String? okText,
  String? cancelText,
  DialogType? type,
  VoidCallback? onOkPressed, // Parameter untuk aksi tombol OK
}) async {
  final theme = Theme.of(globalContext);

  AwesomeDialog(
    context: globalContext,
    dialogType: type == null ? DialogType.success : type,
    animType: AnimType.bottomSlide,
    title: title == null ? 'Sukses' : title,
    titleTextStyle: theme.textTheme.titleLarge?.copyWith(color: textColor),
    desc: desc,
    descTextStyle: theme.textTheme.bodyLarge?.copyWith(
      color: secondaryTextColor,
    ),
    btnOkText: okText == null ? 'Ok' : okText,
    btnOkOnPress: onOkPressed == null ? () {} : onOkPressed,
    btnOkColor: tertiaryColor,
    dialogBackgroundColor: cardColor,
    headerAnimationLoop: false,
  ).show();
}
