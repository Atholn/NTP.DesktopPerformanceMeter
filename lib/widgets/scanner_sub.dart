import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
String iii = "";
class ScannerSub extends StatelessWidget {
  // Declare a field that holds the Todo.
  final List<String> logs;
  final int ii;
  // In the constructor, require a Todo.
  ScannerSub({Key key, List<String> this.logs, int this.ii}) : super(key: key);

//  Future<void> _loadData() async {
//     i= await rootBundle.loadString('logs/dd.txt').toString();
   
  
    
//   }




// Future<String> readFile() async {
//     File file = File('C:/flutter/proj/flutter_application_1/logs/dd.txt'); // 1
//     String fileContent = await file.readAsString(); // 2

//     return (fileContent);
// }

  // This function is triggered when the user presses the floating button



Future<String> getFilePath() async {

   // String  w =  readFile().toString();
   

    String date = DateTime.now().toString();
    String filePath = "C:/flutter/proj/flutter_application_1/logs/$ii"; // 3

    return filePath;
  }

  void saveFile() async {
     String s = "C:/flutter/proj/flutter_application_1/logs/$ii.txt";
      File file = File(s); // 1
     file.writeAsString(logs.toString()); // 2
  }


  @override
  Widget build(BuildContext context) {
  //  _loadData();
    // Use the Todo to create the UI.
     return new Scaffold(
        body: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
            icon: const Icon(Icons.addchart),          
            color: Colors.black,
            onPressed: () {  
               iii = ii.toString();
                  var file = File('logs/$iii.txt');
                  var sink = file.openWrite();
                  sink.write(  logs);
                  sink.close();

                  var file2 = File('logs/dd.txt');
                  var sink2 = file2.openWrite();
                  sink2.write( ii+1);

                  // Close the IOSink to free system resources.
                  sink2.close();

              Navigator.pop(context);
               Navigator.pop(context);}      
          ),
       
      Text(ii.toString()),
      Text(logs.toString()),
      ],
    ),);
}}
String i;



void maine()  {
  


  //final filename = '$iii.txt';
  //var file = await File(filename).writeAsString('some content');
  // Do something with the file.
}