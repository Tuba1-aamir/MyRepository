import 'package:flutter/material.dart';



void main (){
  runApp(ArrowApp());
}
class ArrowApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Expandable list',
      theme: ThemeData(
        //primaryColor: new Color(0xffe91e63),
        //primaryColor: new Color(0xffffc107),
        primaryColor: new Color(0xff6200ee),
        //primaryColor: new Color(0xffF2601F),
      ),
      home: ExpansionList(),//filterchip

    );
  }
}

class ExpansionList extends StatefulWidget{
  @override
  _ExpansionListState createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  List<Item> _data = generateItems(10);
  Widget _buildListPanel(){
    return ExpansionPanelList(
      expansionCallback :(int index ,bool isExpanded){
        setState((){
          _data[index].isExpanded = !isExpanded;
        });
      },
      children :_data.map<ExpansionPanel>((Item item){
        return ExpansionPanel(
            headerBuilder :(BuildContext context,bool isExpanded){
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: ListTile(
              title: Text(item.expandedValue),
              subtitle : Text('to delete this panel,tap the trash'),
              trailing : Icon(Icons.delete),
              onTap:() {
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              },
            ),
            isExpanded : item.isExpanded
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: _buildListPanel(),
        ),
      ),
    );
  }
}
class Item{
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({this.expandedValue, this.headerValue , this.isExpanded = false});
}
List<Item> generateItems(int numberOfItems){
  return List.generate(numberOfItems, (index) {
    return Item(
        headerValue: 'Accounting and Consulting',
        expandedValue : 'This is item number $index'
    );
    return Item(
        headerValue: 'Accounting and Consulting',
        expandedValue : 'This is item number $index'
    );
  });
}

