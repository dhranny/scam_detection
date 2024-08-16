import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ApiService {
  static const String baseUrl = 'https://eme-hxuy.onrender.com';

  Future<List<History>> getHistory() async {
    debugPrint('The history client function');
    final response = await http.get(Uri.parse('$baseUrl/history'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => History.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load history');
    }
  }

  Future<String> test(String user, String text) async {
    final response = await http.post(Uri.parse('$baseUrl/test'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"text": text, "name": user}));

    if (response.statusCode == 200) {
      // User created successfully
      Map<String, dynamic> data = jsonDecode(response.body);
      // Access the value associated with the key "status"
      return data['status'];
    } else {
      // Handle error
      throw Exception('The testing failed');
    }
  }
  // Implement other CRUD operations here
}

class History extends Equatable {
  final int status;
  final String name;
  final String date;
  final String text;

  History(
      {required this.status,
      required this.name,
      required this.date,
      required this.text});

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      status: json['status'],
      name: json['name'],
      date: json['date'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'name': name,
      'date': date,
      'text': text,
    };
  }

  @override
  List<Object?> get props => [status, name, date];
}
