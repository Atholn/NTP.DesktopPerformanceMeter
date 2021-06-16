import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widgets/powershell_connection.dart';

class MainPageeee extends StatefulWidget{
  HomePage createState()=> HomePage();
}

class HomePage extends State<MainPageeee>{
String powershellScriptGPU;



  @override
  void initState() {
    super.initState();
    const oneSec = const Duration(milliseconds:1);
     new Timer.periodic(oneSec, (Timer t) =>  {_startXD()});
  }

_startXD () {
  setState((){
    // print( i.toString());
    //  print(XD); i++;
    powershellScriptGPU =  runPowerShellScript(r'C:\flutter\proj\flutter_application_1\powershell\gpu.ps1', ['1', '2']);


  });
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('CRUD Bro')),
      body: Center(
        child: Text(powershellScriptGPU),
      ),
    );
  }
}


// class Home1 extends StatelessWidget {
//   Home1(){
//     _makeGetRequest(); // option 1. to call the function only when the class is instantiated
//    // _startXD();

//   }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   const oneSec = const Duration(seconds:5);
//   //    new Timer.periodic(oneSec, (Timer t) =>  {});
//   // }


//   @override
//   Widget build(BuildContext context) {
//     _makeGetRequest(); // option 2. to call the function on every rebuild
//     return Scaffold(
//       appBar: AppBar(title: Text('CRUD Bro')),
//       body: Center(
//         child: Text(XD + i.toString() ),
//       ),
//     );
//   }
// }

int i = 0;
String XD='h1';

