
class TodoModel {
  final String? categoryName;
  final String? taskColor;
  final String? totalTask;
  final String? todoId;

  TodoModel({
    required this.categoryName,
    required this.taskColor,
    required this.totalTask,
    required this.todoId,
  });
  TodoModel.fromJson(Map<String, Object?> json)
      : this(
          categoryName: json['category_name']! as String,
          taskColor: json['task_color']! as String,
          totalTask: json['total_task']! as String,
          todoId: json['todo_id']! as String,
        );

  Map<String, Object?> toJson() {
    //tırnak içinde firebasedeki fieldlar

    return {
      'category_name': categoryName,
      'task_color': taskColor,
      "total_task": totalTask,
      "todo_id": todoId,
    };
  }
}
