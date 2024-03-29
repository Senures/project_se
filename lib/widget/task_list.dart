import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:se_to_do/core/model/to_do_model.dart';
import 'package:se_to_do/core/style/colors.dart';
import 'package:se_to_do/pages/detail/provider/detail_provider.dart';
import 'package:se_to_do/widget/edit_dialog.dart';

// ignore: must_be_immutable
class TaskList extends StatelessWidget {
  String todoId;
  TodoModel model;
  DetailProvider dp;

  TaskList({
    Key? key,
    required this.todoId,
    required this.model,
    required this.dp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: dp.tasklist.length,
        itemBuilder: (context, i) {
          return Slidable(
            key: ValueKey(i),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  flex: 1,
                  onPressed: (context) {
                    editDialog(context, dp, i);
                  },
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                  icon: FontAwesomeIcons.pencil,
                  label: 'Edit',
                ),
                SlidableAction(
                  onPressed: (context) {
                    dp.deleteTask(dp.tasklist[i].taskId);
                  },
                  backgroundColor: kTextColor,
                  foregroundColor: Colors.white,
                  icon: FontAwesomeIcons.trash,
                  label: 'Delete',
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      dp.taskStatus(
                        dp.tasklist[i].taskId,
                        dp.tasklist[i].onTap,
                      );
                    },
                    child: ListTile(
                      leading: dp.tasklist[i].onTap
                          ? const Icon(FontAwesomeIcons.squareCheck,
                              color: Colors.black)
                          : const Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.grey,
                            ),
                      title: Text(
                        dp.tasklist[i].task == null
                            ? "sfgfg"
                            : dp.tasklist[i].task.toString(),
                        style: TextStyle(
                            decoration: dp.tasklist[i].onTap
                                ? TextDecoration.none
                                : TextDecoration.lineThrough,
                            color: dp.tasklist[i].onTap
                                ? Colors.black
                                : Colors.grey),
                      ),
                    )),
                Divider(color: Colors.grey.shade300),
              ],
            ),
          );
        });
  }
}
