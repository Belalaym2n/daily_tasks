import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              Expanded(child: Text(AppLocalizations.of(context)!.light)),
              Icon(Icons.done)          ],
          )),
          SizedBox(
            height: 10,
          ),
          Container(child: Row(
            children: [
              Expanded(child: Text(AppLocalizations.of(context)!.dark)),
              Icon(Icons.done)          ],
          )),      ],
      ),
    );
  }
}
