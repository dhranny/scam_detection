import 'package:flutter/material.dart';
import 'client.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double pr = MediaQuery.of(context).devicePixelRatio;
    ApiService apiServ = ApiService();
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(24.0, 80.0, 24.0, 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Scam Detector',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CustomFontFamily')),
            SizedBox(
              height: 20,
            ),
            const Text('Sigup to Scam Detector', style: TextStyle(fontSize: 22)),
            SizedBox(height: 30.0),
            SizedBox(
              height: 60.0,
              child: TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Enter your email address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 25.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Enter your password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: TextStyle(color: Colors.white), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Corner radius
                  ),
                ),
                onPressed: () async {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  bool result = await apiServ.signup(username, password);
                  if (result) {
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text(
                  'SignUp',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
