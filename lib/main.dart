import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:Text(
        'Heeeeelloooo,  how are you?',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style:TextStyle(fontWeight: FontWeight.bold),
      )
    );
  }
}