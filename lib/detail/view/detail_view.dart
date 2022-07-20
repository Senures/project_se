import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/model/to_do_model.dart';
import 'package:se_to_do/style/colors.dart';
import 'package:se_to_do/widget/circularprogress.dart';
import 'package:se_to_do/widget/color_utils.dart';
import 'package:se_to_do/widget/fab_buton.dart';
import 'package:se_to_do/widget/task_dialog.dart';
import 'package:se_to_do/widget/task_list.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../provider/detail_provider.dart';

// ignore: must_be_immutable
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
    //var size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<DetailProvider>(
        create: (context) => DetailProvider(todoId, context),
        builder: (context, child) {
          return Consumer<DetailProvider>(builder: (context, dp, child) {
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  // actionsIconTheme: IconThemeData(),
                  elevation: 0.0,

                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        FontAwesomeIcons.xmark,
                        color: kTextColor,
                        size: 35.0,
                      )),
                  actions: [
                    IconButton(
                        onPressed: () {
                          dp.deleteToDo(todoId);
                        },
                        icon: Icon(
                          FontAwesomeIcons.trash,
                          color: kTextColor,
                        ))
                  ],
                ),
                body: dp.isLoading
                    ? const LoadingCircular()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: SleekCircularSlider(
                                    min: 0,
                                    max: 100,
                                    appearance: CircularSliderAppearance(
                                        animationEnabled: false,
                                        customColors: CustomSliderColors(
                                          progressBarColor:
                                              HexColor(model.taskColor!),
                                          trackColor: Colors.grey.shade300,
                                        ),
                                        size: 80.0,
                                        customWidths: CustomSliderWidths(
                                            trackWidth: 10.0,
                                            progressBarWidth: 8)),
                                    initialValue: dp.initialValue,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.categoryName!,
                                      style: const TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Total task: " + dp.total.toString(),
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 16.0),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Colors.grey.shade300),
                          dp.tasklist.isNotEmpty
                              ? dp.isLoading
                                  ? const LoadingCircular()
                                  : Expanded(
                                      child: TaskList(
                                        todoId: todoId,
                                        model: model,
                                        dp: dp,
                                      ),
                                    )
                              : const Expanded(
                                  child: Center(
                                      child: Text(
                                  "Task list is empty",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                )))
                        ],
                      ),
                floatingActionButton: FabButton(
                  () {
                    taskDialog(
                      context,
                      dp,
                    );
                  },
                  FontAwesomeIcons.plus,
                  HexColor(model.taskColor!),
                ));
          });
        });
  }
}
