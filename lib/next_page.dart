import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  NextPage(this.name);
  final String name;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(name),
          Center(
            child: Container(
              //height:double.infinity,
              color:Colors.red ,
              child:
                RaisedButton(
                  child:Text("戻る"),
                 onPressed: (){
                    Navigator.pop(context,'zeee');
                 },
                )
            ),
          ),
        ],
      ),
    );
  }
}