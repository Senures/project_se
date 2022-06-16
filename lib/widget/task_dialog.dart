import 'package:flutter/material.dart';
import 'package:se_to_do/detail/provider/detail_provider.dart';

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
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                            "assets/logo.png",
                            width: 50.0,
                          ),
                        ),
                      ),
                      const Text(
                        "Enter task",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        controller: dp.taskcontroller,
                        //showCursor: false,
                        cursorColor: Colors.black,
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
                    ],
                  ),
                ),
              );
            },
          ),
          actions: [
            TextButton(
                onPressed: (() {
                  dp.cleartaskText();
                  Navigator.pop(context, false);
                }),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                )),
            TextButton(
                onPressed: (() {
                  dp.createTaskCollection();
                }),
                child: const Text("Create",
                    style: TextStyle(color: Color(0xff0C9463))))
          ],
        );
      }).then((value) {
    if (value == false) {
      print('İPTAL EDILDI');
    }
  });
}
