import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("次のページです"),
        actions: <Widget>[
          Icon(Icons.add),
          Icon(Icons.share),
        ],
      ),
      body: Container(
        height:double.infinity,
        color:Colors.red ,
        child:
          Center(
            child: RaisedButton(
              child:Text("戻る"),
             onPressed: (){
               Navigator.pop(context);
             },
            ),
          )
      ),
    );
  }
}