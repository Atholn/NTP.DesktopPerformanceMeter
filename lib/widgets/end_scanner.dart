import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EndScanner extends StatelessWidget {
  // Declare a field that holds the Todo.
  final List<String> logs;

  // In the constructor, require a Todo.
  EndScanner({Key key, List<String> this.logs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      
       body: ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(logs[index]),
            
          );
        },
      ),
    );
  }
}