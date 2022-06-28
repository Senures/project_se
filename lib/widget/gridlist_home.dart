import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/detail/view/detail_view.dart';
import 'package:se_to_do/home/provider/home_provider.dart';
import 'package:se_to_do/widget/color_circle.dart';
import 'package:se_to_do/widget/color_utils.dart';


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
              itemCount: hp.todolist.length,
              itemBuilder: (BuildContext ctx, index) {
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
                                color: HexColor(hp.todolist[index].taskColor!),
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
              });
        });
      },
    );
  }
}
