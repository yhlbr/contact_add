import 'package:contact_add/contact.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:contact_add/contact_add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () async {
                await addContact();
              }, child: Text('Add Contact')),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addContact() async {
    await ContactAdd.addContact(Contact(
      firstname: "John",
      lastname: "Doe",
      company: "ContactAdd",
      phone: "+41 01 234 56 78",
      email: "hello@example.com"
    ));
  }
}
