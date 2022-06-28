import 'package:flutter/material.dart';
import 'package:se_to_do/utils/const.dart';
import 'package:se_to_do/widget/dialog_textformfield.dart';

import '../home/provider/home_provider.dart';

toDocreateDialog(BuildContext context, HomeProvider hp) {
  var size = MediaQuery.of(context).size;
/* 
  hp.categoryname!.clear();
  hp.todoColor = '';
 */
  showDialog(
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
                    Container(
                      alignment: Alignment.center,
                      width: size.width,
                      child: Image.asset(
                        "assets/logo.png",
                        width: 40.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(ProjectText.categoryname,
                          style: ProjectTextStyles.titledialog),
                    ),
                    DialogTextForm(hp.categoryname, maxLength: 15),
                    Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: hp.taskColor.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    hp.setColor(i);
                                  },
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5.0),
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: hp.taskColor[i].isSelected
                                      ? hp.taskColor[i].colors
                                      : Colors.white,
                                  border: Border.all(
                                      color: hp.taskColor[i].colors,
                                      width: 5.0),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
                onPressed: (() {
                  hp.clearDialaog();
                  Navigator.pop(context);
                }),
                child: Text(ProjectText.cancel,
                    style: ProjectTextStyles.cancelStyle)),
            TextButton(
                onPressed: (() {
                  hp.createToDo(context);
                  hp.clearDialaog();
                  Navigator.pop(context);
                }),
                child: Text(ProjectText.create,
                    style: ProjectTextStyles.createStyle))
          ],
        );
      });
}
