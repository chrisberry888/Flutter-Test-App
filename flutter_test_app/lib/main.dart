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
        body: Center(
          child: Container(
              child: Column(
                  children: _rows
              ),
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
          ),
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
    int colnum = 2;
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
            Padding(padding: EdgeInsets.all(10)),
            _buildRectangle(),
          ],
        );
      }

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