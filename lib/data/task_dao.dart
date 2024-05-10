import 'package:sqflite/sqflite.dart';
import 'package:start_project/components/task.dart';
import 'package:start_project/data/database.dart';

class TaskDAO {
  static const String tableSql =
      'CREATE TABLE $_tablename($_name TEXT, $_difficulty INTEGER, $_image TEXT)';

  static const String _tablename = 'TaskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task task) async {
    print('Iniciando o save: ');
    final Database database = await getDatabase();
    var itemExists = await find(task.nome);
    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      print('A tarefa não existe');
      return await database.insert(_tablename, taskMap);
    } else {
      print('A tarefa ja existia');
      return await database.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [task.nome]);
    }
  }

  Future<List<Task>> findAll() async {
    print('Acessando o FindAll: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> tasksMap) {
    print('Convertendo to List: ');
    final List<Task> tasks = [];
    for (Map<String, dynamic> linha in tasksMap) {
      final Task task = Task(
          nome: linha[_name],
          foto: linha[_image],
          dificuldade: linha[_difficulty]);
      tasks.add(task);
    }
    print('Lista de Tarefas $tasks');
    return tasks;
  }

  Map<String, dynamic> toMap(Task task) {
    print('Convertendo tarefa em Map: ');
    final Map<String, dynamic> taskMap = Map();
    taskMap[_name] = task.nome;
    taskMap[_difficulty] = task.dificuldade;
    taskMap[_image] = task.foto;
    print('Mapa de Tarefas: $taskMap');
    return taskMap;
  }

  Future<List<Task>> find(String taskName) async {
    print('Acessando find: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database
        .query(_tablename, where: '$_name = ?', whereArgs: [taskName]);
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String taskName) async {
    print('Deletando tarefa: $taskName');
    final Database database = await getDatabase();
    return database
        .delete(_tablename, where: '$_name = ?', whereArgs: [taskName]);
  }
}
