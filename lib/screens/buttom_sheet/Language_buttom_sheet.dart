import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageButtomSheet extends StatelessWidget {
  const LanguageButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Row(
            children: [
              Expanded(child: Text("English")),
              Icon(Icons.done)          ],
          )),SizedBox(
            height: 10,
          ),
          Container(child: Row(
            children: [
              Expanded(child: Text("Arabic")),
              Icon(Icons.done)          ],
          )),      ],
      ),
    );
  }
}
