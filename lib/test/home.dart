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
    powershellScriptGPU =  runPowerShellScript(r'C:\flutter\proj\flutter_application_1\powershell\gpu.ps1');
  });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(powershellScriptGPU),
      ),
    );
  }
}



