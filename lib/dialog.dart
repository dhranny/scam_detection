import 'package:flutter/material.dart';
import 'client.dart';
import 'result.dart';

class FormDialog extends StatefulWidget {
  const FormDialog({super.key});

  @override
  State<FormDialog> createState() => _FormDialogState();
}

class _FormDialogState extends State<FormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _longTextController = TextEditingController();


  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String longText = _longTextController.text;
      ApiService serv = ApiService();
      String result = await serv.test(name, longText);
      SentimentResultScreen screen = SentimentResultScreen(
        isPositive: int.parse(result) == 0 ? true : false, 
        resultText: createText(int.parse(result)),
        );
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    }
  }
  
  String createText(int result){
    if(result == 0){
      return 'The result of the test shows that the user is not a scammer';
    }
    else{
      return 'The result of the test shows that the user is a scammer';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter Details'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration:
                    const InputDecoration(labelText: 'Suspects Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _longTextController,
                maxLines: 5,
                decoration: const InputDecoration(
                    labelText: 'Paste the suspected text'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
