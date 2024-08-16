import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'lists.dart';
import 'home.dart';
import 'client.dart';

class Histor with ChangeNotifier {
  List<History> _history = [];

  List<History> get history => _history;

  void setHistory(List<History> history) {
    _history = history;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Histor(),
      child: MyApp())
    );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scam Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => HomeScreen(),
        '/history': (context) => HistoryList()
      },
      home: HomeScreen(),
    );
  }
}
