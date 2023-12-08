import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemingButtomSheet extends StatelessWidget {
  const ThemingButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Row(
            children: [
              Expanded(child: Text("Light")),
              Icon(Icons.done)          ],
          )),
          SizedBox(
            height: 10,
          ),
          Container(child: Row(
            children: [
              Expanded(child: Text("Dark")),
              Icon(Icons.done)          ],
          )),      ],
      ),
    );
  }
}
