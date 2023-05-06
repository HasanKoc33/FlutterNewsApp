import 'package:flutter/material.dart';
import 'package:news_app/core/errors/news_error.dart';

class ErrorPage extends StatelessWidget {
  NewsError error;
  ErrorPage({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Error : ${error!.message}"),
    ));
  }
}
