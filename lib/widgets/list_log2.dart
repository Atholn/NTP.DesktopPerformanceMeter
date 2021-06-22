import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/powershell_connection.dart';

class Log2 {

   String title;
   String description;
   String id;
  Log2({@required this.title, @required this.description, @required this.id});
}

class Log{
  String l;
  String title;
  String id;
  Log({@required this.l, @required this.title, @required this.id});
}

class ListScreen extends StatelessWidget {

  List<Log2> ListLogs = [
    Log2(title: "Log1", description: "GPU Proccess", id: "1" ),
    Log2(title: "Log2", description: "GPU Proccess", id: "2" )
  ];
  

  ListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    READ ();
    return Scaffold(
      appBar: AppBar(
        title: Text('logs'),
      ),
      body: ListView.builder(
        itemCount: Logs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(Logs[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen2(todo: Logs[index]),
                ),
              );
            },
          );
        },
        
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Log2 todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, Log2 this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description +'/' + todo.id),
      ),
    );
  }
}


class DetailScreen2 extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Log todo;

  // In the constructor, require a Todo.
  DetailScreen2({Key key, Log this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.l +'/' + todo.id),
      ),
    );
  }
}




int ii;
List<Log> Logs = [];

  READ () {    
    ii = int.parse(runPowerShellScript(r'C:\flutter\proj\flutter_application_1\powershell\read.ps1'));  
   Logs = [];
    for(int i = 0; i<ii;i++)
    {
      List<String> list = [];
      list.add(i.toString());
      Logs.add(Log(title: "Log$i", l: runPowerShellScript2(r'C:\flutter\proj\flutter_application_1\powershell\read2.ps1', list), id: "$i" ));
    }
  }