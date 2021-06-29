

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/scannner.dart';


class ScannerOptions  extends StatelessWidget {
  const ScannerOptions ({Key key}) : super(key: key);
  @override
  Widget build (BuildContext context){
    return Container(
        height: double.infinity,
        child: Center(
            child:Column(
                children: [
                  MyStatelessWidget(),
                  TypeScan(),
                ],
        ))
    );
  }
}

int i = 0;

class MyStatelessWidget extends StatelessWidget {
   MyStatelessWidget({Key key}) : super(key: key);

  @override
  
  @override
  Widget build(BuildContext context) {
    return Material(     
      child: Center(      
        child: Ink(          
            child: IconButton(
            icon: const Icon(Icons.addchart),          
            color: Colors.black,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Scanner(check1: dropdownValue) ),);}
          ),
        ),
      ),
    );
  }
}

String dropdownValue = 'CPU';
class TypeScan extends StatefulWidget {
  TypeScan({Key key}) : super(key: key);

  @override
  State<TypeScan> createState() => _TypeScanState();
}



class _TypeScanState extends State<TypeScan> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[  'CPU',  'RAM'] //'VRAM','GPU',
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


