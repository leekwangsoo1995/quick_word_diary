import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_book_model.dart';

//今日の気付き
//→modelでは、めちゃくちゃインスタンスを作ってるわけではなく一つのインスタンスを作って、データを作ったりしてる。
//throwとcatch。throwで投げたerrorを、(e)で受け取れる。

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本を追加'),
        ),
        body: Consumer<AddBookModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (text) {
                      model.bookTitle = text;
                    },
                  ),
                  RaisedButton(
                      child: Text('追加'),
                      onPressed: () async {
                        try {
                          await model.addBookToFireStore();
                          await showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('保存完了!'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                          Navigator.of(context).pop();
                        } catch (e) {
                          showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(e.toString()),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        }
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
