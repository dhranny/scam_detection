
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SentimentResultScreen extends StatelessWidget {
  final bool isPositive; // Pass true if sentiment is positive, false if negative
  final String resultText; // Text that describes the result

  SentimentResultScreen({required this.isPositive, required this.resultText});



  void sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'dhrannydan2018@gmail.com',
      queryParameters: {
        'subject': 'Scam Report',
        'body': 'Please describe the scam you encountered.'
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      print('Could not launch $emailLaunchUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sentiment Analysis Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Result Text
            Text(
              resultText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            
            // Icon representing sentiment
            Icon(
              isPositive ? Icons.check_circle_outline : Icons.sentiment_dissatisfied,
              size: 100,
              color: isPositive ? Colors.green : Colors.red,
            ),
            SizedBox(height: 40),

            // Button at the bottom
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if(isPositive){
                  Navigator.pop(context);
                }else{
                  sendEmail();
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                isPositive ? 'cancel' : 'report',
                
                style: TextStyle(fontSize: 20, color: isPositive ? Colors.black : Colors.red),
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
