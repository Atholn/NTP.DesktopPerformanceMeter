import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/powershell_connection.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../main.dart';



class Chart extends StatelessWidget {
  final int Log;
  Chart({Key key, int this.Log }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: _Chart(Log : this.Log),
    );
  }
}

class _Chart extends StatefulWidget {

  final int Log;
  _Chart({Key key, this.Log}) : super(key: key);

  @override
  _MyChart createState() => _MyChart(Log: Log);
}

class _MyChart extends State<_Chart> {
  List<LogValue> _chartLogValues;
  TooltipBehavior _tooltipBehavior;

  final int Log;
  _MyChart({  this.Log}) :super();

  @override
  void initState() {    
    _chartLogValues = getLogValues(Log);
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Back',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
            ),
            SfCartesianChart(
              title: ChartTitle(text: 'Log $Log'),
              legend: Legend(isVisible: true),
              tooltipBehavior: _tooltipBehavior,
              series: <ChartSeries>[
                LineSeries<LogValue, double>(
                  name: 'Log Values',
                  dataSource: _chartLogValues,
                  xValueMapper: (LogValue values, _) => values.id,
                  yValueMapper: (LogValue values, _) => values.value,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  enableTooltip: true)
              ],
              primaryXAxis: NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
              ),
              primaryYAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,),
    )])));
  }

  List<LogValue> getLogValues(int j){
    List<String> list1 = [];
    list1.add(j.toString());
    String l = runPowerShellScript2(r'.\powershell\readLog.ps1', list1);
    var lDecode = json.decode(l);

    List<LogValue> LogValuesV=[];
    for(int i=0; i<lDecode.length;i++)  {
      LogValuesV.add(LogValue( double.parse(i.toString()),   double.parse (lDecode[i].toString() )));
    }
    return LogValuesV;
  }
}

class LogValue { 
  final double id;
  final double value;
  LogValue( this.id, this.value);
}