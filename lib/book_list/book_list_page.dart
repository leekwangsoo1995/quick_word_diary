import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickworddiary/add_book/add_book_page.dart';
import 'package:quickworddiary/book_list/book_list_model.dart';
import 'package:quickworddiary/domain/book.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Column(
          children: [
            Container(
              child: Text('aa'),
            ),
            Consumer<BookListModel>(
              builder: (context, model, child) {
                final books = model.books;
                final listTiles = books
                    .map(
                      (book) => ListTile(
                        title: Text(book.title),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddBookPage(
                                  book: book,
                                ),
                                fullscreenDialog: true,
                              ),
                            );
                            model.fetchBooks();
                          },
                        ),
                        onLongPress: () async {
                          await showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('${book.title}削除しますか?'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('ok'),
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        await deleteBook(context, model, book);
                                      },
                                    ),
                                  ],
                                );
                              });
                          print('ohoho');
                        },
                      ),
                    )
                    .toList();
                return ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: listTiles,
                );
              },
            ),
          ],
        ),
        floatingActionButton:
            Consumer<BookListModel>(builder: (context, model, child) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBookPage(),
                  fullscreenDialog: true,
                ),
              );
              model.fetchBooks();
            },
          );
        }),
      ),
    );
  }

  Future deleteBook(
      BuildContext context, BookListModel model, Book book) async {
    try {
      await _showDialog(context, '削除しますた');
      await model.deleteBook(book);
      model.fetchBooks();
    } catch (e) {
      await _showDialog(context, e.toString());
    }
  }

  Future _showDialog(BuildContext context, String title) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
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
}
