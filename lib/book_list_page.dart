import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本一覧'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        //疑問、streambuilderとは何だろうか？
        //collectionのbooksが、Firestore上のコレクション名にあたる。
        //stream: Firestore.instance.collection('books').snapshots(),
        //以下のコードでは、addressを見にいく。
        //ちなみに、addressの中身が空白の場合は空白が帰ってくる模様。
        stream: Firestore.instance.collection('address').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              //documentが一つ一つのレコードかな？
              return ListTile(
                //documentのtitleで、カラム名を指定している。
                title: Text(document['title']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
