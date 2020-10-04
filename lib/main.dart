import 'package:flutter/material.dart';
import 'package:quickworddiary/next_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String text = "aa";
  final myFocusNode = FocusNode();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("lee"),
        actions: <Widget>[
          Icon(Icons.add),
          Icon(Icons.share),
        ],
      ),
      body:Container(
        width:double.infinity,
        child:Column(
          children: <Widget>[
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return 'hey! you must complete text';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'ここがヒントテキストだよ',
              ),
              onChanged: (text){
                print('input text is :$text');
              },

            ),
            TextField(
              controller: myController,
              focusNode: myFocusNode,
            ),
            RaisedButton(
                child:Text('Focus!!'),
                onPressed:(){
                  showDialog(
                    context:context,
                    builder:(context){
                      return AlertDialog(
                        content:Text('tt'),
                      );
                    },
                  );
                },
            ),
          ],
        )

    ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}