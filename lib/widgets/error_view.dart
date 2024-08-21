import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  String error;
  Function onRetryCkick;

  ErrorView({super.key, required this.error, required this.onRetryCkick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(error),
        ElevatedButton(
            onPressed: () {
              onRetryCkick();
            },
            child: Text("Retry"))
      ],
    );
  }
}
