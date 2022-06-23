import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:se_to_do/model/task_model.dart';


class DetailProvider extends ChangeNotifier {
  final String todoId; //sabit id o yüzden final
  TextEditingController? taskcontroller =
      TextEditingController(text: "initialvalue");
  String? value = "";
  TextEditingController? editcontroller = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser; //anlık kullanıcı
  bool isLoading = true;
  BuildContext context;
  double initialValue = 0;
  int total = 0;

  List<TaskModel> tasklist = [];
  bool onTap = false;

  List<bool> liste = [];

  DetailProvider(this.todoId, this.context) {
    getTaskCollection();
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
      "onTap": true
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
      var circular =
          tasklist.where((element) => element.onTap == false).length.toString();
      total = tasklist.where((element) => element.onTap == true).length;
      initialValue = tasklist.isEmpty
          ? 0
          : (double.parse(circular) * 100) / tasklist.length;

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
     
    }
  }

  deleteToDo(String todoId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection("to_do")
        .doc(todoId)
        .delete();
    Navigator.pop(context);
    notifyListeners();
  }

  deleteTask(String taskId) async {
   
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection("to_do")
        .doc(todoId)
        .collection("tasks")
        .doc(taskId)
        .delete();

    notifyListeners();
  }

  editTask(String taskId) {
    tasklist.clear();
    var newTask = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("to_do")
        .doc(todoId)
        .collection("tasks")
        .doc(taskId);
    newTask.update({"task": value});
    notifyListeners();
  }
}
