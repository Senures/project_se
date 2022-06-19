import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/home/provider/home_provider.dart';
import 'package:se_to_do/model/to_do_model.dart';
import 'package:se_to_do/widget/circularprogress.dart';
import 'package:se_to_do/widget/color_circle.dart';
import 'package:se_to_do/widget/color_utils.dart';
import 'package:se_to_do/widget/task_dialog.dart';
import 'package:se_to_do/widget/task_list.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../provider/detail_provider.dart';

class DetailView extends StatelessWidget {
  String todoId;
  TodoModel model;

  List<TodoModel> todolist = [];
  DetailView({
    Key? key,
    required this.todoId,
    required this.model,
    required this.todolist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<DetailProvider>(
        create: (context) => DetailProvider(todoId, context),
        builder: (context, child) {
          return Consumer<DetailProvider>(builder: (context, dp, child) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                actionsIconTheme:IconThemeData(

                ),
                elevation: 0.0,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 35.0,
                    )),
                actions: const [

                  Icon(FontAwesomeIcons.trash)
                  /*  PopupMenuButton(
                      icon: const Icon(
                        Icons.settings,
                        size: 35.0,
                      ),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              onTap: () {
                                dp.clearToDo(todoId);
                              },
                              child: const Text("Delete"),
                              value: 1,
                            ),
                          ]) */
                ],
              ),
              body: dp.isLoading
                  ? const Center(
                      child: Circular(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SleekCircularSlider(
                                    min: 0,
                                    max: 100,
                                    onChangeEnd: (value) {
                                      print("bitti");
                                    },
                                    appearance: CircularSliderAppearance(
                                        customColors: CustomSliderColors(
                                          trackColor: Colors.grey.shade300,
                                        ),
                                        size: 70.0,
                                        customWidths: CustomSliderWidths(
                                            trackWidth: 10.0,
                                            progressBarWidth: 8)),
                                    initialValue: dp.initialValue,
                                  ),
                                  /*  ColorCircle(
                                    color: HexColor(model.taskColor!),
                                  ), */
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.categoryName!,
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Total task: " +
                                            dp.tasklist.length.toString(),
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          dp.tasklist.isNotEmpty
                              ? dp.isLoading
                                  ? const Circular()
                                  : TaskList(
                                      todoId: todoId,
                                      model: model,
                                    )
                              : Container(child: Text("henüz liste boş"))
                        ],
                      ),
                    ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: const Color(0xff2D31FA),
                child: const Icon(
                  Icons.add,
                  size: 30.0,
                ),
                onPressed: () {
                  taskDialog(context, dp);
                },
              ),
            );
          });
        });
  }
}
/* ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: dp.tasklist.length,
                                  itemBuilder: (context, i) {
                                    return Column(
                                      children: [
                                        const Divider(
                                          color: Colors.black,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            dp.taskStatus(
                                              dp.tasklist[i].taskId,
                                              dp.tasklist[i].onTap,
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              dp.tasklist[i].onTap
                                                  ? const Icon(
                                                      FontAwesomeIcons.dashcube)
                                                  : Icon(Icons.add,
                                                      color: dp.onTap
                                                          ? Colors.black
                                                          : Colors.grey),
                                              Text(
                                                dp.tasklist[i].task!,
                                                style: TextStyle(
                                                    color: dp.tasklist[i].onTap
                                                        ? Colors.black
                                                        : Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  }) */
