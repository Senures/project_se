import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DetailProvider extends ChangeNotifier {
  final String todoId; //sabit id o yüzden final
  TextEditingController? taskcontroller = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser; //anlık kullanıcı
  bool isLoading = true;
  BuildContext context;
  double initialValue = 0;

  List<TaskModel> tasklist = [];
  bool onTap = false;
  var tamamlanmayan;
  List<bool> liste = [];

  DetailProvider(this.todoId, this.context) {
    getTaskCollection();
    // getTotalTask();
    //createTaskCollection();
  }

  createTaskCollection() async {
    tasklist.clear();
    var tasks = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("to_do")
        .doc(todoId)
        .collection("tasks");

    //var alltask = tasks.get();
    //tüm görevler dökümanını getircek

    await tasks.add({
      "task": taskcontroller!.text,
      "create_date": DateTime.now(),
      "onTap": false
    });
    taskcontroller!.clear();
    Navigator.pop(context);
  }

  getTaskCollection() async {
    tasklist.clear();
    isLoading = true;

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("to_do")
        .doc(todoId)
        .collection("tasks")
        .snapshots()
        .listen((event) {
      tasklist.clear();
      for (var element in event.docs) {
        tasklist.add(TaskModel(
            task: element.data()["task"],
            onTap: element.data()["onTap"],
            taskId: element.id));
      }
      var tamamlanan =
          tasklist.where((element) => element.onTap == true).length.toString();
      initialValue = tasklist.isEmpty
          ? 0
          : (double.parse(tamamlanan) * 100) / tasklist.length;

      /* print("UZUNLUK " +
          tasklist.where((element) => element.onTap == true).length.toString());  */
      notifyListeners();
    });

    isLoading = false;
    notifyListeners();
  }

  taskStatus(String taskId, bool ontap) async {
    tasklist.clear();
    var taskStatus = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("to_do")
        .doc(todoId)
        .collection("tasks")
        .doc(taskId);
    taskStatus.update({"onTap": !ontap});
    notifyListeners();

    //alanı güncelledik
    //firebasedeki tıklan
  }

  createTask() {
    if (taskcontroller!.text.isNotEmpty) {
      createTaskCollection();
    } else {
      print("oluşmadı görev");
    }
  }
/* 
  getTotalTask() {
    var uzunluk = tasklist.where((element) => element.onTap == true).length;
    print("dogruların uzunlugu : " + uzunluk.toString());
  } */

  /*  cleartaskText() {
    taskcontroller!.clear();
    notifyListeners();
  } */

  clearToDo(String taskId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection("to_do")
        .doc(todoId)
        .delete();
    Navigator.pop(context);
    notifyListeners();
  }
}

class TaskModel {
  final String? task;
  bool onTap;
  final String taskId;
  TaskModel({required this.task, required this.onTap, required this.taskId});
  TaskModel.fromJson(Map<String, Object?> json)
      : this(
          task: json['task']! as String,
          onTap: json['onTap']! as bool,
          taskId: json['taskId']! as String,
        );

  Map<String, Object?> toJson() {
    //tırnak içinde firebasedeki fieldlar

    return {'task': task, 'onTap': onTap, "taskId": taskId};
  }
} 
 /*  getTaskCollection() async {
    tasklist.clear();
    isLoading = true;
    var tasks = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("to_do")
        .doc(todoId)
        .collection("tasks")
        .get();
    for (var element in tasks.docs) {
      print("f,rebaseden gelen " + element.data()["create_date"]);
      tasklist.add(DetailModel(
          createDate: element.data()["create_date"],
          endDate: element.data()["end_date"],
          isCompleted: element.data()["is_completed"]));
    }

    isLoading = false;
    notifyListeners();
  } */

/* class DetailModel {
  final String? createDate;
  final String? endDate;
  final bool? isCompleted;
  final String? task;

  DetailModel(
      {required this.createDate,
      required this.endDate,
      required this.isCompleted});
  DetailModel.fromJson(Map<String, Object?> json)
      : this(
          createDate: json['create_date']! as String,
          endDate: json['end_date']! as String,
          isCompleted: json['is_completed']! as bool,
        );

  Map<String, Object?> toJson() {
    //tırnak içinde firebasedeki fieldlar

    return {
      'create_date': createDate,
      'end_date': endDate,
      "is_completed": isCompleted
    };
  }
}
 */
  /*  getTodoList() async {
    todolist.clear();
    isLoading = true;
    var veri = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection("to_do")
        .get();
    for (var element in veri.docs) {
      todolist.add(TaskModel(
          categoryName: element.data()["category_name"],
          taskColor: element.data()["task_color"],
          totalTask: element.data()["total_task"]));
      // print(element.data()["category_name"]);böyle yazmak yerine keyleri bi modelde topladık
    }
    /*  todolist
        .add(TaskModel(categoryName: "Oluştur", taskColor: "", totalTask: "")); */
    isLoading = false;
    notifyListeners();
  } */