import 'package:flutter/material.dart';

class EvidenceCollectionScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gather Evidence'),
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
                Text('Communication Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Platform (e.g., dating site, social media)'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Date of First Communication'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Personal Contact Information Shared'),
                ),
                SizedBox(height: 20),

                // Personal Information
                Text('Personal Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Personal Information Shared (e.g., full name, address)'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Specific Information or Documents Requested by Scammer'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Photos or Videos Shared'),
                ),
                SizedBox(height: 20),

                // Financial Transactions
                Text('Financial Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Amount of Money Sent and Method (e.g., wire transfer)'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Details of Transactions and Records'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'False Financial Promises or Investments'),
                ),
                SizedBox(height: 20),

                // Profile Information
                Text('Profile Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Scammer\'s Profile Details (e.g., username, location)'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Aliases or Identities Used by Scammer'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Inconsistencies in Profile Information'),
                ),
                SizedBox(height: 20),

                // Behavior and Requests
                Text('Behavior and Requests', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Unusual Requests or Demands'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Aggressive or Coercive Behavior'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Suspicious or Illegal Actions Requested'),
                ),
                SizedBox(height: 20),

                // Other Victims
                Text('Other Victims', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Other Users with Similar Experiences'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Actions Taken by Dating Platform'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Additional Witnesses or Evidence'),
                ),
                SizedBox(height: 40),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission logic
                      }
                    },
                    child: Text('Submit Evidence'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
