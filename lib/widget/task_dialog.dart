import 'package:flutter/material.dart';
import 'package:se_to_do/detail/provider/detail_provider.dart';
import 'package:se_to_do/utils/const.dart';
import 'package:se_to_do/widget/dialog_textformfield.dart';

taskDialog(BuildContext context, DetailProvider dp) {
  var size = MediaQuery.of(context).size;
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
                width: size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width,
                        child: Image.asset(
                          "assets/images/tasks.png",
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
                      maxLength: 100,
                    )
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
                onPressed: (() {
                  Navigator.pop(context, false);
                }),
                child: Text(
                  ProjectText.cancel,
                  style: ProjectTextStyles.cancelStyle,
                )),
            TextButton(
                onPressed: (() {
                  dp.createTask();
                }),
                child: Text(ProjectText.create,
                    style: ProjectTextStyles.createStyle))
          ],
        );
      }).then((value) {
    if (value == false) {}
  });
}
