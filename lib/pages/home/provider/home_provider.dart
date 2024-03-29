import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/model/task_color.dart';
import 'package:se_to_do/core/model/to_do_model.dart';
import 'package:se_to_do/widget/snackbar_widget.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController? categoryname = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  bool isLoading = true;
  String? todoColor;
  List<TodoModel> todolist = [];

  List<TaskColor> taskColor = [
    TaskColor(const Color(0xff28d5c2), false),
    TaskColor(const Color(0xff7e6be8), false),
    TaskColor(const Color(0xff73d197), false),
    TaskColor(const Color(0xffe7647f), false),
    TaskColor(const Color(0xfff9cf67), false),
    TaskColor(const Color(0xfff39970), false),
  ];

  HomeProvider() {
    getTodoList();
  }

  setColor(int i) {
    for (var element in taskColor) {
      if (element.colors == taskColor[i].colors) {
        todoColor =
            taskColor[i].colors.toString().split('(0xff')[1].split(')')[0];
        //burda color tipinde rengi stringe çevirdik
        //firebase yüklerken string yükleyip çekerken de color olarak yansıtıyoruz
        element.isSelected = !element.isSelected;
      } else {
        element.isSelected = false;
      }
    }
    notifyListeners();
  }

  createTodoCollection() async {
    var to_do = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("to_do");

    await to_do.add({
      "category_name": categoryname!.text,
      "task_color": todoColor, //burda firebase ekledik
      "total_task": "",
    });
  }

  createToDo(BuildContext context) {
    if (categoryname!.text.isNotEmpty && todoColor != null) {
      createTodoCollection();
      context.toPageBack();
    } else {
      snackBarCustom(
        context,
        "Please fill in completely!",
      );
    }
    notifyListeners();
  }

  getTodoList() async {
    todolist.clear();

    isLoading = true;
    notifyListeners();

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection("to_do")
        .snapshots()
        .listen((event) {
      todolist.clear();
      isLoading = true;
      notifyListeners();

      for (var element in event.docs) {
        todolist.add(TodoModel(
            categoryName: element.data()["category_name"],
            taskColor: element.data()["task_color"],
            totalTask: element.data()["total_task"],
            todoId: element.id));
      }

      isLoading = false;
      notifyListeners();
    });
  }

  clearDialaog() {
    categoryname!.clear();
    for (var element in taskColor) {
      element.isSelected = false;
    }
    todoColor = null;
    notifyListeners();
  }
}
