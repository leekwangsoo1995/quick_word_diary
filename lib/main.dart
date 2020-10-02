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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  String text = "aa";

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
      body:
        Column(
          children: <Widget>[
            Container(
              height:200,
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed ',
                    ),
                    Text('I think so'),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child:RaisedButton(
                child:Text(text),
                onPressed: () async{
                  //押したら反応するコードがhere...
                  final result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NextPage('Lee'),
                      ),
                  );
                  text = result;
                  print(result);
                },
              ),
              color: Colors.blue,
            ),
            //Container(
            //  child:Text('a'),
            //),
          ],
        ),



      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}