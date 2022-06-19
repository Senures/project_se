import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/detail/provider/detail_provider.dart';
import 'package:se_to_do/model/to_do_model.dart';
import 'package:se_to_do/widget/color_utils.dart';

class TaskList extends StatelessWidget {
  String todoId;
  TodoModel model;
  TaskList({Key? key, required this.todoId, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
      create: (context) => DetailProvider(todoId, context),
      builder: (context, child) {
        return Consumer<DetailProvider>(builder: (context, dp, child) {
          return ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: dp.tasklist.length,
              itemBuilder: (context, i) {
                return Slidable(
                  key: ValueKey(i),
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        flex: 1,
                        onPressed: (context) {},
                        backgroundColor: Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                        label: 'Archive',
                      ),
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Color(0xFF0392CF),
                        foregroundColor: Colors.white,
                        icon: Icons.save,
                        label: 'Save',
                      ),
                    ],
                  ),
                  startActionPane: ActionPane(
                    dismissible: DismissiblePane(
                      onDismissed: () {},
                    ),
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        label: "Delete",
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        onPressed: (context) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("delete ")));
                        },
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      const Divider(
                        color: Colors.black26,
                      ),
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
                              dp.tasklist[i].task!,
                              style: TextStyle(
                                  decoration: dp.tasklist[i].onTap
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough,
                                  color: dp.tasklist[i].onTap
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                          ) /*  Row(
                          children: [
                            dp.tasklist[i].onTap
                                ? const Icon(FontAwesomeIcons.check)
                                : Icon(Icons.add,
                                    color:
                                        dp.onTap ? Colors.black : Colors.grey),
                            Text(
                              dp.tasklist[i].task!,
                              style: TextStyle(
                                  color: dp.tasklist[i].onTap
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                          ],
                        ), */
                          ),
                    ],
                  ),
                );
              });
        });
      },
    );
  }
}
