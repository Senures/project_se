import 'package:flutter/material.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/style/app_text.dart';
import 'package:se_to_do/core/style/app_textstyle.dart';
import 'package:se_to_do/core/style/colors.dart';
import 'package:se_to_do/core/style/image.dart';

import 'package:se_to_do/pages/detail/provider/detail_provider.dart';

editDialog(BuildContext context, DetailProvider dp, int i) {
  dp.dialogInit(dp.tasklist[i].task!);
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
                    TextFormField(
                      controller: dp.editcontroller,
                      cursorColor: kTextColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: kBorderColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kTextColor),
                            borderRadius: BorderRadius.circular(10),
                          )),
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
                onPressed: (() {
                  dp.editTask(dp.tasklist[i].taskId);
                  context.toPageBack();
                }),
                child: Text(ProjectText.create,
                    style: ProjectTextStyles.createStyle))
          ],
        );
      }).then((value) {
    //tıklandığını anlamak için
  });
}
