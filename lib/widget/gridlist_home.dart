import 'package:flutter/material.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/style/colors.dart';
import 'package:se_to_do/pages/detail/view/detail_view.dart';
import 'package:se_to_do/pages/home/provider/home_provider.dart';
import 'package:se_to_do/widget/color_circle.dart';
import 'package:se_to_do/widget/color_utils.dart';

// ignore: must_be_immutable
class GridListHome extends StatelessWidget {
  HomeProvider hp;
  GridListHome({Key? key, required this.hp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
        ),
        itemCount: hp.todolist.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onTap: () {
              context.toPage(
                DetailView(
                  todoId: hp.todolist[index].todoId!,
                  model: hp.todolist[index],
                  todolist: hp.todolist,
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
                          offset: Offset(0, 10),
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
                          color: HexColor(hp.todolist[index].taskColor!),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5.0),
                          child: Text(
                            hp.todolist[index].categoryName!,
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          );
        });
  }
}
