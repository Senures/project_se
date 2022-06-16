import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableView extends StatelessWidget {
  List vegetables = ["carrot", "apple", "banana", "lemon", "beer"];
  SlidableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: vegetables.length,
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
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("delete ${vegetables[i]}")));
                      },
                    )
                  ],
                ),
                child: ListTile(
                  title: Text(vegetables[i]),
                ),
              );
            }));
  }
}
