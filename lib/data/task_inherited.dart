import 'package:flutter/material.dart';
import 'package:start_project/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required super.child,
  });

  List<Task> taskList = [
    Task(
      nome: 'Aprender Flutter',
      foto:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FqjIMzwA1W38%2Fmaxresdefault.jpg&f=1&nofb=1&ipt=8719b86c80fce10530489aac129e135b5f2b7adeb22b846c4203124a62eb3edb&ipo=images',
      dificuldade: 3,
    ),
    Task(
      nome: 'Andar de bike',
      foto:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FqjIMzwA1W38%2Fmaxresdefault.jpg&f=1&nofb=1&ipt=8719b86c80fce10530489aac129e135b5f2b7adeb22b846c4203124a62eb3edb&ipo=images',
      dificuldade: 1,
    ),
    Task(
      nome: 'Meditar',
      foto:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FqjIMzwA1W38%2Fmaxresdefault.jpg&f=1&nofb=1&ipt=8719b86c80fce10530489aac129e135b5f2b7adeb22b846c4203124a62eb3edb&ipo=images',
      dificuldade: 5,
    ),
  ];

  void newTask(String name, int difficulty, String photo) {
    taskList.add(Task(nome: name, foto: photo, dificuldade: difficulty));
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No MyInherited found in context');
    return result!;
  }
}
