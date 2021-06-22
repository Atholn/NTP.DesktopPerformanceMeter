import 'dart:convert';

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
  
  String type;
  String date;
  int length;
  double averange;
  Log({@required this.l, @required this.title, @required this.id, @required this.type,  @required this.date ,  @required this.length ,  @required this.averange});
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
                  builder: (context) => DetailScreen(todo: Logs[index]),
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
  final Log todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, Log this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.title + '\n' + todo.date + '\n' + todo.id + '\n' + todo.type + '\n' + todo.l + "\n" + todo.length.toString() + "\n" + todo.averange.toString())
      ),
    );
  }
}

// class Log{
//   String l;
//   String title;
//   String id;
  
//   String type;
//   String date;
//   String length;


int ii;
List<Log> Logs = [];

  READ () {    
    ii = int.parse(runPowerShellScript(r'C:\flutter\proj\flutter_application_1\powershell\read.ps1'));  
   Logs = [];
    for(int i = 0; i<ii;i++)
    {
      List<String> list1 = [];
      list1.add(i.toString());
      List<String> list2 = [];
      list2.add(i.toString()+'i');
      String ListInfo = runPowerShellScript2(r'C:\flutter\proj\flutter_application_1\powershell\read2.ps1', list2);
      var ListInfoDecode = json.decode(ListInfo);
    // info.add('Log ' + (ii).toString());
    //               info.add(DateTime.now().toString());
    //               info.add(type);
    //               info.add(length.toString());
      double sum=1;
      String l = runPowerShellScript2(r'C:\flutter\proj\flutter_application_1\powershell\read2.ps1', list1);
       var lDecode = json.decode(l);
      for(int j=0; j< int.parse( ListInfoDecode[3]); j++)
      {
          sum += lDecode[j];
      }
      double av =  0;
      av=sum/double.parse(ListInfoDecode[3]);

      Logs.add(Log( l: l, id: "$i", title:  ListInfoDecode[0], type: ListInfoDecode[2], date: ListInfoDecode[1], length:int.parse( ListInfoDecode[3]) , averange: av));

    }



  }