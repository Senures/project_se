import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/model/task_color.dart';
import 'package:se_to_do/model/to_do_model.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController? categoryname = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser; //anlık kullanıcı
  bool isLoading = true;
  String? todoColor;

  List<TaskColor> taskColor = [
    TaskColor(const Color(0xff6927FF), false),
    TaskColor(const Color(0xffFFD581), false),
    TaskColor(const Color(0xffD3EBCD), false),
    TaskColor(const Color(0xff516BEB), false),
    TaskColor(const Color(0xff80ED99), false),
    TaskColor(const Color(0xffFFBED8), false),
  ];

  HomeProvider() {
    getTodoList();
    //clearTodo();
  }

  List<TodoModel> todolist = [];

  setColor(int i) {
    //taskColor[i].isSelected = !taskColor[i].isSelected;
    for (var element in taskColor) {
      if (element.colors == taskColor[i].colors) {
        todoColor =
            taskColor[i].colors.toString().split('(0xff')[1].split(')')[0];
        //burda color tipinde rengi stringe çevirdik
        //firebase yüklerken string yükleyip çekerken de color olarak yansıtıyoruz dmi
        element.isSelected = !element.isSelected;
      } else {
        element.isSelected = false;
      }
    }
    notifyListeners();
  }

  createTask() {
    if (categoryname!.text.isNotEmpty && todoColor != null) {
      createTodoCollection();
    } else {
      print("task eklenmedi");
    }

    /*   print(categoryname?.text.isEmpty );
    if (categoryname!.text.isNotEmpty) {
      createTodoCollection();
    } else {
      print("aaaaaaa");
    } */
    notifyListeners();
    /*  for (var element in taskColor) {
      if (element.isSelected == true && categoryname!.text.isNotEmpty) {
        createTodoCollection();
      }
    } */
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

  getTodoList() async {
    todolist.clear();
    print('11 == ' + todolist.length.toString());
    notifyListeners();
    isLoading = true;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection("to_do")
        .snapshots()
        .listen((event) {
      todolist.clear();
      for (var element in event.docs) {
        todolist.add(TodoModel(
            categoryName: element.data()["category_name"],
            taskColor: element.data()["task_color"],
            totalTask: element.data()["total_task"],
            todoId: element.id));
      }

      print('22 == ' + todolist.length.toString());
      notifyListeners();
    });

    /* .get();
    for (var element in veri.docs) {
      todolist.add(TodoModel(
          categoryName: element.data()["category_name"],
          taskColor: element.data()["task_color"],
          totalTask: element.data()["total_task"],
          todoId: element.id));
      // print(element.data()["category_name"]);böyle yazmak yerine keyleri bi modelde topladık
    } */

    isLoading = false;
    notifyListeners();
  }

  clearCategoryText() {
    categoryname!.clear();
    notifyListeners();
  }
}
