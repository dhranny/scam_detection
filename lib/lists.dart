import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dialog.dart';
import 'client.dart';
import 'main.dart';

class HistoryList extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    ApiService appServ = new ApiService();
    appServ.getHistory().then((onValue) {
      Provider.of<Histor>(context, listen: false).setHistory(onValue);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Scam Detector', style: TextStyle(color: Colors.white)),
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
            child: Consumer<Histor>(builder: (context, historyProvider, child) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(historyProvider.history[index].name),
                    subtitle:
                        Text(historyProvider.history[index].text),
                    trailing: Text(historyProvider.history[index].date),
                  );
                },
                itemCount: historyProvider.history.length,
              );
            }),
          ),
        ],
      ),
    );
  }
}
