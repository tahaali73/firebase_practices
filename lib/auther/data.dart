import 'package:fire5/functions/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('database'),
        actions: [
          IconButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.leave_bags_at_home))
        ],
      ),
    body: Container(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      ElevatedButton(onPressed: (){Create('pets', 'kity', 'jerry', 'cat',5);}, child: Text('Creat')),
      ElevatedButton(onPressed: (){update('pets', 'tom', 'animal','tiger');}, child: Text('Update')),
      ElevatedButton(onPressed: (){}, child: Text('Retrive')),
      ElevatedButton(onPressed: (){delete('pets', 'kity');}, child: Text('Delete')),
    ],),),
    );
  }
}
