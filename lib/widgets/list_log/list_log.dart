import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/list_log/chart.dart';
import 'package:flutter_application_1/widgets/powershell_connection.dart';

class ListScreen extends StatelessWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    readLogs ();
    return Scaffold(
      appBar: AppBar(
        title: Text('logs'),
      ),
      body: ListView.builder(
        itemCount: _logs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_logs[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(log: _logs[index]),
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
  final Log log;

  // ignore: type_init_formals
  DetailScreen({Key key, Log this.log}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(log.title),
      ),       
      body: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(log.title + '\n' + log.date + '\n' +'Type: ' + log.type + '\n' + 'Srednia: ' +  log.averange.toString()),   
           IconButton(
            icon: const Icon(Icons.bar_chart ),
            tooltip: 'Chart',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chart(Log: int.parse(log.id)),
                ),
              );
            },
          ),
          Expanded(
            flex: 1,
            child: new Text(
              log.l,
            )
          ),        
        ]
      ),
    );
  }
}

int _numberOfLogs;
List<Log> _logs = [];


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

void readLogs () {    
  _numberOfLogs = int.parse(runPowerShellScript(r'.\powershell\readNumberOfLogs.ps1'));  
  _logs = [];
    for(int i = 0; i<_numberOfLogs; i++)
    {
      List<String> list1 = [];
      list1.add(i.toString());
      List<String> list2 = [];
      list2.add(i.toString()+'i');
      String listInfo = runPowerShellScript2(r'.\powershell\readLog.ps1', list2);
      var listInfoDecode = json.decode(listInfo);

      double sum=1;
      String l = runPowerShellScript2(r'.\powershell\readLog.ps1', list1);
       var lDecode = json.decode(l);
      for(int j=0; j< int.parse( listInfoDecode[3]); j++)
      {
          sum += lDecode[j];
      }
      double av =  0;
      av=sum/double.parse(listInfoDecode[3]);

      _logs.add(Log( l: l, id: "$i", title:  listInfoDecode[0], type: listInfoDecode[2], date: listInfoDecode[1], length:int.parse( listInfoDecode[3]) , averange: av));
  }
}



