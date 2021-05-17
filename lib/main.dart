import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/list_log2.dart';
import 'package:flutter_application_1/widgets/main_window.dart';



void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

// class Types extends State<ListVerticalTypes>{
//   List<ListOfTypes> ListTypes =[
//     ListOfTypes(name: "Sport"),
//     ListOfTypes(name: "Nauka"),
//     ListOfTypes(name: "Praca"),
//     ListOfTypes(name: "Kino"),
//     ListOfTypes(name: "Sen"),
//     ListOfTypes(name: "Internet"),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Lista dostępnych zajęć'),
//         ),
//         body: ListView.builder(
//           itemCount: ListTypes.length,
//           itemBuilder: (context, index){
//             return ListTile(
//               title: Text('${ListTypes[index].name}'),
//               onTap: () {

//               }
//             );},
//         )
//     );
//   }
// }



/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {




  const MyStatefulWidget({Key key}) : super(key: key);




  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    MainProgram(),
    ListScreen(
    ),
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaner PROCES '),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.scanner),
            label: 'Scanner',
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List Logs',

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}



