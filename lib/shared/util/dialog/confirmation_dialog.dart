import 'package:flutter/material.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:find_kajian/shared/theme/theme_size.dart';
import 'package:find_kajian/shared/util/translation/language.dart';
import 'package:find_kajian/shared/widget/form/button/button.dart';
import 'package:find_kajian/state_util.dart';

Future<bool> showConfirmationDialog({
  String? message,
}) async {
  var confirm = false;
  await showDialog<void>(
    context: globalContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirm',
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message ?? 'Are you sure you want to delete this item?'.tr),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: QButton(
                      label: 'No'.tr,
                      size: sm,
                      color: disabledColor,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: QButton(
                      label: 'Yes'.tr,
                      size: sm,
                      onPressed: () {
                        confirm = true;
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

  return Future.value(confirm);
}
