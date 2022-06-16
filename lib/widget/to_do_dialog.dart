import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/provider/home_provider.dart';

toDocreateDialog(BuildContext context, HomeProvider hp) {
  var size = MediaQuery.of(context).size;

  hp.categoryname!.clear();
  hp.todoColor  = '';
  
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          /*    title: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              "assets/logo.png",
              width: 40.0,
            ),
          ), */
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width,
                          child: Image.asset(
                            "assets/logo.png",
                            width: 50.0,
                          ),
                        ),
                      ),
                      const Text(
                        "Category name",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        maxLength: 15,
                        controller: hp.categoryname,
                        // showCursor: false,

                        cursorColor: Colors.black,
                        // controller: lp.emailcontroller,
                        decoration: InputDecoration(
                            //  prefixIcon:prefixIcon ,
                            border: InputBorder.none,

                            // labelText: 'Enter something',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      Container(
                        alignment: Alignment.center,
                        //width: size.width,
                        height: 50.0,
                        // color: Colors.red,
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
                ),
              );
            },
          ),
          actions: [
            TextButton(
                onPressed: (() {
                  hp.clearCategoryText();
                  for (var element in hp.taskColor) {
                    element.isSelected = false;
                  }
                  Navigator.pop(context);
                }),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                )),
            TextButton(
                onPressed: (() {

                  hp.createTask();
                  Navigator.pop(context);
                }),
                child: const Text("Create",
                    style: TextStyle(color: Color(0xff0C9463))))
          ],
        );
      });
}
