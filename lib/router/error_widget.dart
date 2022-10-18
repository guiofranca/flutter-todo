import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String title;
  final String message;

  const ErrorWidget({Key? key, this.title = 'Error', this.message = 'Error'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
