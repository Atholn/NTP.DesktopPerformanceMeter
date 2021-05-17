
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
class MainProgram  extends StatelessWidget {
  const MainProgram ({Key key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return Container(
        height: double.infinity,
        child: Center(
            child:Column(
                children: [
                  // _SideMenuIconTab(
                  //   iconData: Icons.home,
                  //   title: 'Home',
                  //   onTap: () {},
                  // ),
                  MyStatelessWidget(),
                  TypeScan(),
                 
                ],
        ))
    );
  }
}




class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      
      child: Center(
        
        child: Ink(
            
            child: IconButton(
            icon: const Icon(Icons.addchart),
            
            color: Colors.black,
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanPanel() ));},

          ),
        ),
      ),
    );
  }
}


///------------------------------------
class TypeScan extends StatefulWidget {
  const TypeScan({Key key}) : super(key: key);

  @override
  State<TypeScan> createState() => _TypeScanState();
}

String dropdownValue = 'GPU';

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
      items: <String>[ 'GPU', 'CPU', 'VRAM', 'RAM']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

//----
class ScanPanel extends StatefulWidget {
  const ScanPanel({Key key}) : super(key: key);

  @override
  State<ScanPanel> createState() => _ScanPanelState();
}

class _ScanPanelState extends State<ScanPanel> {

final StopWatchTimer _stopWatchTimer = StopWatchTimer();
final _isHours = true;
final _scrollCntroller = ScrollController();
    


@override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
    
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    _scrollCntroller;
    
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
            Navigator.pop(context);
          },
        ),
        Text(dropdownValue),
        StreamBuilder<int>(
          stream: _stopWatchTimer.rawTime,
          //initialData: _stopWatchTimer.rawTime,
          builder: (context, snapshot){
            final value = snapshot.data;
            final displayTime = StopWatchTimer.getDisplayTime(value, hours: _isHours);
            return Text(displayTime);
        }),
        CustomButton(
          color: Colors.green,
          label: 'Start',
          onPress: (){
            _stopWatchTimer.onExecute.add(StopWatchExecute.start);
          },
        ),
        CustomButton(
          color: Colors.red,
          label: 'Stop',
          onPress: (){
            _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
          },
        ),CustomButton(
          color: Colors.blue,
          label: 'Lap',
          onPress: (){
            _stopWatchTimer.onExecute.add(StopWatchExecute.lap);
          },
        ),
        CustomButton(
          color: Colors.yellow,
          label: 'Reset',
          onPress: (){
            _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
          },
        ),
        Container(
          height: 120,
          margin: const EdgeInsets.all(8),
          child: StreamBuilder<List<StopWatchRecord>>(
            stream: _stopWatchTimer.records,
            //initialData: _stopWatchTimer.records.valueWrapper,
            builder: (context, snapshot) {
              final value = snapshot.data;
              if(value.isEmpty){
                return Container();
              }

              Future.delayed(const Duration(milliseconds: 100), (){
                _scrollCntroller.animateTo(
                  _scrollCntroller.position.maxScrollExtent,
                   duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut);
              });

              return ListView.builder(
                controller: _scrollCntroller,
                itemBuilder: (context,index){
                  final data = value[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${index + 1} - ${data.displayTime}',
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      ),
                      Divider(height: 1.0),
                    ],
                  );
                },
                itemCount: value.length,);
            },
          ),
        )
      ],
    ),);
  }
}

class CustomButton extends StatelessWidget {
  final Color color;
  final Function onPress;
  final String label;
  CustomButton({this.color, this.onPress, this.label});
  @override
  Widget build(BuildContext context){
    return RaisedButton(
      onPressed: onPress, 
      color: color, 
      shape: const StadiumBorder(),
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      )
    );
  }




}
