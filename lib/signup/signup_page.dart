import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickworddiary/domain/book.dart';
import 'package:quickworddiary/signup/signup_model.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('サインアップ'),
        ),
        body: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'メールやでい',
                    ),
                    controller: mailController,
                    onChanged: (text) {
                      model.mail = text;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'passやデイ',
                    ),
                    obscureText: true,
                    controller: passwordController,
                    onChanged: (text) {
                      model.password = text;
                    },
                  ),
                  RaisedButton(
                      child: Text('登録する'),
                      onPressed: () async {
                        await model.signUp();
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
