import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Field Docked',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _TextFieldDockedPageState createState() => _TextFieldDockedPageState();
}

class _TextFieldDockedPageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  String _displayText = '';

  void _updateText() {
    setState(() {
      _displayText = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scam Detectora'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'You entered: $_displayText',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Enter skeptical text',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                IconButton(onPressed: ()=>{}, icon: Icon(Icons.send)),
              ],
            ),,
            )
          ),
        ],
      ),
    );
  }
}
