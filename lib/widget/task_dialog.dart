import 'package:flutter/material.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/style/app_text.dart';
import 'package:se_to_do/core/style/app_textstyle.dart';
import 'package:se_to_do/core/style/image.dart';
import 'package:se_to_do/widget/dialog_textformfield.dart';

import '../pages/detail/provider/detail_provider.dart';

taskDialog(BuildContext context, DetailProvider dp) {
  showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: context.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: context.width,
                        child: Image.asset(
                          logoImg,
                          width: 40.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(ProjectText.enterTask,
                          style: ProjectTextStyles.titledialog),
                    ),
                    DialogTextForm(
                      dp.taskcontroller,
                    )
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
                onPressed: () => context.toPageBack(),
                child: Text(
                  ProjectText.cancel,
                  style: ProjectTextStyles.cancelStyle,
                )),
            TextButton(
                onPressed: () => dp.createTask(),
                child: Text(ProjectText.create,
                    style: ProjectTextStyles.createStyle))
          ],
        );
      }).then((value) {});
}
