import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/detail/view/detail_view.dart';
import 'package:se_to_do/home/provider/home_provider.dart';
import 'package:se_to_do/widget/color_circle.dart';
import 'package:se_to_do/widget/color_utils.dart';
import 'package:se_to_do/widget/to_do_dialog.dart';

class GridListHome extends StatelessWidget {
  const GridListHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        return Consumer<HomeProvider>(builder: (context, hp, child) {
          return GridView.builder(
              primary: false,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 20,
              ),
              itemCount: hp.todolist.length +
                  1, //bu listede ek eleman için +1 dedik tamam
              itemBuilder: (BuildContext ctx, index) {
                if (index == (hp.todolist.length)) {
                  //index son elemana eşit mi
                  //index son elemanda mı dolaştı burda  dimi

                  return Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 1.0,
                                spreadRadius: 1.0)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              ColorCircle(color: Color(0xff94B3FD))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  toDocreateDialog(context, hp);
                                },
                                child: const Text(
                                  "CREATE",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2D31FA),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ));
                } else {
                  return InkWell(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => DetailView(
                            todoId: hp.todolist[index].todoId!,
                            model: hp.todolist[index],
                            todolist: hp.todolist,
                          ),
                        ),
                      );
                    },
                    child: Container(
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0)
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ColorCircle(
                                  color:
                                      HexColor(hp.todolist[index].taskColor!),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      //createDialog(context, hp);
                                    },
                                    child: Text(
                                      hp.todolist[index].categoryName!,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ],
                        )),
                  );
                }
              });
        });
      },
    );
  }
}
 /*  Container(
                                  margin: const EdgeInsets.all(5.0),
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: HexColor(
                                            hp.todolist[index].taskColor!),
                                        /*    color: hp
                                                            .taskColor[index]
                                                            .colors, */
                                        width: 5.0),
                                    shape: BoxShape.circle,
                                  ),
                                ), */