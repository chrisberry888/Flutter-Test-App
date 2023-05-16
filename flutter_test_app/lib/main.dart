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
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
                children: _rows
            ),
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
            _buildRectangle(_count),
          ],
        ));
      } else if (_count % colnum == 1){
        _rows[_count - 1 ] = Row(
          children: [
            ..._rows[_count - 1].children,
            Padding(padding: EdgeInsets.all(10)),
            _buildRectangle(_count),
          ],
        );

        _rows.add(Row(
          children: [
            _buildSpacer(),
          ],
        ));
      }

      _count += 1;


    });
  }

  Widget _buildSpacer() {
    return Container(
      width: 1,
      height: 10,
      color: Colors.transparent,
    );
  }

  Widget _buildRectangle(int num) {
    return Container(
      width: 150,
      height: 100,
      color: Colors.red,
      child: Center(
        child: Text(
          (num+1).toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),

    );
  }


}