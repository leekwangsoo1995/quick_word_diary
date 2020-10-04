import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final items = List<String>.generate(10000, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: Icon(Icons.videocam),
          title:Text('Youtube Demo'),
          actions: <Widget>[
            SizedBox(
              width:44,
              child: FlatButton(
                child:Icon(Icons.search),
                onPressed: (){
                 //todo Write Pressed action
                },
              ),
            ),
            SizedBox(
              width:44,
              child: FlatButton(
                child:Icon(Icons.more_vert),
                onPressed: (){
                  //todo Write Pressed action
                },
              ),
            ),
          ],
      ),
        body:Container(
          child:Column(
            children: <Widget>[
             Row(
               children: [
                 SizedBox(
                   height:60,
                   width:60,
                   child:
                       Image.network("https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png"),
                 ),
                 SizedBox(
                   width:8,
                 ),
                 Column(
                   children:<Widget>[
                    Text('youtube demo的な'),
                       FlatButton(
                         child:Row(
                           children: [
                             Icon(
                                 Icons.video_call,
                                     color:Colors.red,
                             ),
                             Text('登録する'),
                           ],
                         ),
                         onPressed: (){
                           //todo Write Pressed action
                         },
                     ),
                   ],
                 ),
               ],
             ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.all(2),
                      leading:Image.network("https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png"),
                      title: Column(
                        children: [
                          Text('Flutter入門 completedaaaaa'),
                          Row(
                            children:<Widget>[
                              Text('200回再生'),
                              Text('5日前 '),

                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    );
                  },
                ),
              ),
        ],
          ),
        ),
      ),
    );
  }
}

