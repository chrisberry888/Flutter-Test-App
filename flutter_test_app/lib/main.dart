import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _count = 0;
  List<Row> _rows = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dynamic Rows Example'),
        ),
//        body: Column(
        //         children: _rows.map((row) => Row(children: row)).toList(),
//        ),
        body: Container(
            child: Column(
                children: _rows
            ),
          margin: const EdgeInsets.all(50),
          padding: const EdgeInsets.all(10),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: _addRow,
          tooltip: 'Add Rectangle',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _addRow() {
    int colnum = 3;
    setState(() {
      if (_count % colnum == 0) {
        _rows.add(Row(
          children: [
            _buildRectangle(),
          ],
        ));
      } else if (_count % colnum == 1){
        _rows[_count ~/ colnum] = Row(
          children: [
            ..._rows[_count ~/ colnum].children,
            Icon(Icons.person),
          ],
        );
      } else if (_count % colnum == 2){
        _rows[_count ~/ colnum] = Row(
          children: [
            ..._rows[_count ~/ colnum].children,
            Icon(Icons.table_rows_sharp),
          ],
        );
      };

      _count += 1;


    });
  }


  Widget _buildRectangle() {
    return Container(
      width: 150,
      height: 100,
      color: Colors.red,
    );
  }


}