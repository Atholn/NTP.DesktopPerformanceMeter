import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

String iii = "";
class ScannerSub extends StatelessWidget {
  // Declare a field that holds the Todo.
  final List<String> logs;
  final int ii;
  final String type;
  final int length;
  // In the constructor, require a Todo.
  ScannerSub({Key key, List<String> this.logs, int this.ii, String this.type, int this.length}) : super(key: key);


Future<String> getFilePath() async {
    String filePath = "C:/flutter/proj/flutter_application_1/logs/$ii"; // 3

    return filePath;
  }

  void saveFile() async {
    String s = "C:/flutter/proj/flutter_application_1/logs/$ii.txt";
    File file = File(s);
    file.writeAsString(logs.toString());
  }

  @override
  Widget build(BuildContext context) {
     return new Scaffold(
      body: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
            icon: const Icon(Icons.save),          
            color: Colors.black,
            onPressed: () {  
              iii = ii.toString();
              var file = File('logs/$iii.txt');
              var sink = file.openWrite();
              sink.write(  logs);
              sink.close();  

              var file2 = File('logs/numberOfLogs.txt');
              var sink2 = file2.openWrite();
              sink2.write( ii+1);
              sink2.close();

              var file3 = File('logs/${iii}i.txt');
              var sink3 = file3.openWrite();
              List<String> info =[];
              info.add("\"Log " + (ii).toString()+"\"");
              info.add("\""+DateTime.now().toString()+"\"");
              info.add("\""+type+"\"");
              info.add("\""+length.toString()+"\"");
              sink3.write(info);
              sink3.close();

              Navigator.pop(context);
              Navigator.pop(context);}      
        ),   
        IconButton(
          icon: const Icon(Icons.cancel ),          
          color: Colors.black,
          onPressed: () { 
            Navigator.pop(context);
            Navigator.pop(context);}      
        ),    
        Text(ii.toString()),
        Expanded(
          flex: 1,
          child: new Text(
            logs.toString(),
          )
        ),         
      ],
    ),);
}}
String i;
