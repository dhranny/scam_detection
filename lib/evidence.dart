import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class EvidenceCollectionScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController platform = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController personal = TextEditingController();
  TextEditingController personalInfo = TextEditingController();
  TextEditingController specific = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController transactions = TextEditingController();
  TextEditingController falsePromises = TextEditingController();
  TextEditingController profile = TextEditingController();
  TextEditingController aliases = TextEditingController();
  TextEditingController inconsistencies = TextEditingController();
  TextEditingController unusual = TextEditingController();
  TextEditingController aggressive = TextEditingController();
  TextEditingController illegal = TextEditingController();
  TextEditingController otherUsers = TextEditingController();
  TextEditingController actions = TextEditingController();
  TextEditingController additional = TextEditingController();

  void sendEmail(BuildContext context) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'pressforabuja@police.gov.ng',
      queryParameters: {
        'subject': 'Scam Report',
        'body':
            'This scammer engaged me on  ${platform.text}. I shared my personal information with them. ${amount.text} as gone between'
            +'us as they promised that they will ${falsePromises.text}.'
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Gather Evidence', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Communication Details
                Text('Communication Details',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: platform,
                  decoration: InputDecoration(
                      labelText: 'Platform (e.g., dating site, social media)'),
                ),
                TextFormField(
                  controller: date,
                  decoration:
                      InputDecoration(labelText: 'Date of First Communication'),
                ),
                TextFormField(
                  controller: personal,
                  decoration: InputDecoration(
                      labelText: 'Personal Contact Information Shared'),
                ),
                SizedBox(height: 20),

                // Personal Information
                Text('Personal Information',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: personalInfo,
                  decoration: InputDecoration(
                      labelText:
                          'Personal Information Shared (e.g., full name, address)'),
                ),
                TextFormField(
                  controller: specific,
                  decoration: InputDecoration(
                      labelText:
                          'Specific Information or Documents Requested by Scammer'),
                ),
                SizedBox(height: 20),

                // Financial Transactions
                Text('Financial Transactions',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: amount,
                  decoration: InputDecoration(
                      labelText:
                          'Amount of Money Sent and Method (e.g., wire transfer)'),
                ),
                TextFormField(
                  controller: transactions,
                  decoration: InputDecoration(
                      labelText: 'Details of Transactions and Records'),
                ),
                TextFormField(
                  controller: falsePromises,
                  decoration: InputDecoration(
                      labelText: 'False Financial Promises or Investments'),
                ),
                SizedBox(height: 20),

                // Profile Information
                Text('Profile Information',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: profile,
                  decoration: InputDecoration(
                      labelText:
                          'Scammer\'s Profile Details (e.g., username, location)'),
                ),
                TextFormField(
                  controller: aliases,
                  decoration: InputDecoration(
                      labelText: 'Aliases or Identities Used by Scammer'),
                ),
                TextFormField(
                  controller: inconsistencies,
                  decoration: InputDecoration(
                      labelText: 'Inconsistencies in Profile Information'),
                ),
                SizedBox(height: 20),

                // Behavior and Requests
                Text('Behavior and Requests',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: unusual,
                  decoration:
                      InputDecoration(labelText: 'Unusual Requests or Demands'),
                ),
                TextFormField(
                  controller: aggressive,
                  decoration: InputDecoration(
                      labelText: 'Aggressive or Coercive Behavior'),
                ),
                TextFormField(
                  controller: illegal,
                  decoration: InputDecoration(
                      labelText: 'Suspicious or Illegal Actions Requested'),
                ),
                SizedBox(height: 20),

                // Other Victims
                Text('Other Victims',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: otherUsers,
                  decoration: InputDecoration(
                      labelText: 'Other Users with Similar Experiences'),
                ),
                TextFormField(
                  controller: actions,
                  decoration: InputDecoration(
                      labelText: 'Actions Taken by Dating Platform'),
                ),
                TextFormField(
                  controller: additional,
                  decoration: InputDecoration(
                      labelText: 'Additional Witnesses or Evidence'),
                ),
                SizedBox(height: 40),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        sendEmail(context);
                      }
                    },
                    child: Text('Submit Evidence', style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
