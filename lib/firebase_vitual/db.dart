import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DB {
  CollectionReference db = FirebaseFirestore.instance.collection('VirtualLab');
 late BuildContext context;
  void add(String path, String? title, String? link, String? topic,
      String? description) async {
    final s = db.doc(path).collection('Topics');
    try {
      final data = {
        "title": title,
        "link": link,
        "topic": topic,
        "description": description
      };
      await s.add(data);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Data add Successfully')));
    } on FirebaseException catch (e) {
       ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('$e')));
      print("error........... $e");
    }
  }
}
