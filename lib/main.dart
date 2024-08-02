import 'package:flutter/material.dart';
import 'dialog.dart';
import 'home.dart';

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
      routes: {
        '/home' : (context) => HomeScreen(),
        '/history': (context) => HomePage()
      },
      home: HomeScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _TextFieldDockedPageState createState() => _TextFieldDockedPageState();
}

class _TextFieldDockedPageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scam Detector'),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const FormDialog(),
          );
        },
        ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return const ListTile(
                    title: Text("user123456789"),
                    subtitle: Text("User user123456789 was found to be a scammer"),
                    trailing: Text("12/12/2020"),
                  );
                }
                )
            ),
          ),
          
        ],
      ),
    );
  }
}
