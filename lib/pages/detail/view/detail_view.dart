import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/extensions/widget_helper_extension.dart';

import 'package:se_to_do/core/style/colors.dart';
import 'package:se_to_do/widget/circularprogress.dart';
import 'package:se_to_do/widget/color_utils.dart';
import 'package:se_to_do/widget/add_button.dart';
import 'package:se_to_do/widget/empty_list_widget.dart';
import 'package:se_to_do/widget/task_dialog.dart';
import 'package:se_to_do/widget/task_list.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../core/model/to_do_model.dart';
import '../provider/detail_provider.dart';

// ignore: must_be_immutable
class DetailView extends StatefulWidget {
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
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  var globalKey = GlobalKey();
  double paddingHeight = 0.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (globalKey.currentContext != null) {
        paddingHeight = globalKey.currentContext!.size!.height;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
        create: (context) => DetailProvider(widget.todoId, context),
        builder: (context, child) {
          return Consumer<DetailProvider>(builder: (context, dp, child) {
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar(dp, context),
                body: buildBody(dp),
                floatingActionButton: buildFabButton(dp, context));
          });
        });
  }

  buildAppBar(DetailProvider dp, BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
          onPressed: () => context.toPageBack(),
          icon: Icon(
            FontAwesomeIcons.xmark,
            color: kTextColor,
            size: 35.0,
          )),
      actions: [
        IconButton(
            onPressed: () => dp.deleteToDo(widget.todoId),
            icon: Icon(
              FontAwesomeIcons.trash,
              color: kTextColor,
            ))
      ],
    );
  }

  buildTitleContainer(DetailProvider dp) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        indicatorTask(dp),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.model.categoryName!,
              style:
                  const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Total task: " + dp.total.toString(),
              style: const TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
          ],
        )
      ],
    ).paddingAll(padding: 10.0);
  }

  buildBody(DetailProvider dp) {
    return Container(
      width: context.width,
      height: context.height - paddingHeight - AppBar().preferredSize.height,
      child: dp.isLoading
          ? const LoadingCircular()
          : Column(
              children: [
                buildTitleContainer(dp),
                dp.tasklist.isEmpty
                    ? EmptyListWidget(
                        messsage: "Task list is empty",
                      )
                    : Divider(color: Colors.grey.shade300),
                TaskList(
                  todoId: widget.todoId,
                  model: widget.model,
                  dp: dp,
                ),
              ],
            ),
    );
  }

  indicatorTask(DetailProvider dp) {
    return SleekCircularSlider(
      min: 0,
      max: 100,
      appearance: CircularSliderAppearance(
          animationEnabled: false,
          customColors: CustomSliderColors(
            progressBarColor: HexColor(widget.model.taskColor!),
            trackColor: Colors.grey.shade300,
          ),
          size: 80.0,
          customWidths:
              CustomSliderWidths(trackWidth: 10.0, progressBarWidth: 8)),
      initialValue: dp.initialValue,
    ).paddingSymmetric(horizontal: 15.0);
  }

  buildFabButton(DetailProvider dp, BuildContext context) {
    return AddingButton(
      () {
        taskDialog(
          context,
          dp,
        );
      },
      FontAwesomeIcons.plus,
      HexColor(widget.model.taskColor!),
    );
  }
}
