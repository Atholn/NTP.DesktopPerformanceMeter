import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


// void Powershell() {
//   print(runPowerShellScript(r'C:\flutter\proj\flutter_application_1\powershell\Sum.ps1', ['1', '2']));
  
// }

String runPowerShellScript(String scriptPath, List<String> argumentsToScript) {
  return Process.runSync(
          'Powershell.exe', ['-File', scriptPath, ...argumentsToScript]).stdout
      as String;
}




class Log2 {

   String title;
   String description;
   String id;
  Log2({@required this.title, @required this.description, @required this.id});
}




class Powershell extends StatelessWidget {
 String powershellScript = runPowerShellScript(r'C:\flutter\proj\flutter_application_1\powershell\Sum.ps1', ['1', '2']);
  List<Log2> ListLogs = [
    Log2(title: "Log1", description: "GPU Proccess", id: "1" ),
    Log2(title: "Log2", description: "GPU Proccess", id: "2" )
  ];
 
  Powershell({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('logs'),
      ),
      body: Center(child: Text(powershellScript)),
    
      
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