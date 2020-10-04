import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickworddiary/main_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: ChangeNotifierProvider<MainModel>(
        create:(_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title:Text('Youtube Demo'),
        ),
          body:

            Consumer<MainModel>(
                  builder: (context, model,child) {
                    return Center(
                      child: Column(
                        children: [
                          Text(
                              model.LeeText,
                                  style:TextStyle(
                                fontSize: 30,
                          )
                          ),
                          RaisedButton(
                              child:Text('button'),
                              onPressed: (){
                                model.changeLeeText();
                              }
                          ),
                        ],
                      ),
                    );
                  }
                ),
        ),
      ),
    );
  }
}

