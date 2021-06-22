import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widgets/powershell_connection.dart';
import 'package:flutter_application_1/widgets/scanner_sub.dart';
import 'package:path_provider/path_provider.dart';


class Scanner extends StatefulWidget{

final String check1;
  Scanner({Key key, String this.check1}) : super(key: key);

  _Scanner createState()=> _Scanner(check :this.check1);
}



class _Scanner extends State<Scanner> {

  final String check;
  _Scanner({ String this.check}) ;
  List<String> logs = [];

String powerShellReturnValue = "";
String actualTime='';
Timer _timer;
@override
  void initState() {
    super.initState();
    if(check == 'CPU')
    {
        new Timer.periodic(Duration(seconds:5), (Timer _timer) =>  {CPU()});
    }
    if(check == 'RAM')
    {
        new Timer.periodic(Duration(seconds:5), (Timer _timer) =>  {RAM()});
    }
  }

// Timer _timer;
    
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//           setState(() {
//             greeting = "After Some time ${DateTime.now().second}";
//           });
//         });
    
//     FlatButton(
//     	onPressed: (){
//            _timer.cancel();
//       }, child: Text("Stop")
//     )

int ii;
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> _localFile(String name) async {
  final path = await _localPath;
  return File('$path/$name');
}

Future<String> _read(String filename) async {
  try {
    final file = await _localFile('C:\flutter\proj\dd.txt');

    // Read the file.
    return await file.readAsString();
  } catch (e) {
    // If encountering an error, return 0.
    return "Can't read";
  }
}
  READ () {
  setState((){
    ii = int.parse(runPowerShellScript(r'C:\flutter\proj\flutter_application_1\powershell\read.ps1'));
  });
  }
  CPU () {
  setState((){
    powerShellReturnValue =  runPowerShellScript(r'C:\flutter\proj\flutter_application_1\powershell\CPU.ps1');
    logs.add(powerShellReturnValue);
    //actualTime= _timer.toString();
  });
  }

  RAM () {
  setState((){
    powerShellReturnValue =  runPowerShellScript(r'C:\flutter\proj\flutter_application_1\powershell\RAM.ps1');
    logs.add(powerShellReturnValue);
  });
  }
@override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            _timer.cancel();
            Navigator.pop(context);
          },
        ),
        Text(powerShellReturnValue),
      //  Text(actualTime),
        IconButton(
            icon: const Icon(Icons.addchart),          
            color: Colors.black,
            onPressed: () {

                  READ ();
              //_timer.cancel();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ScannerSub(logs: logs,  ii : ii, type: check , length : logs.length ) ),);}

            

          ),
      ],
    ),);
  }
}
