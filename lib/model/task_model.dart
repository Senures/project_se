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