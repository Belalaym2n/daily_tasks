import 'package:daily_tasks5/constant/color.dart';
import 'package:daily_tasks5/provider/my_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageButtomSheet extends StatelessWidget {
  const LanguageButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      color: pro.mode==ThemeMode.dark?
    blackColor:Colors.white,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              pro.changeLanguage("en");
            },
            child: Container(child: Row(
              children: [
                Expanded(child: Text("${AppLocalizations.of(context)!.eng}",


                style: TextStyle(
                  color: pro.langcode=='en'?
                      primaryColor:
                      Colors.black

                ),)),

                pro.langcode=="ar"?

                SizedBox.shrink():
                Icon(Icons.done,color: primaryColor,)
              ],
            )),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              pro.changeLanguage("ar");
            },
            child: Container(child: Row(
              children: [
                Expanded(child: Text(AppLocalizations.of(context)!.arab,


                  style: TextStyle(
                      color: pro.langcode=='en'?

                      Colors.black:
                      primaryColor
                  ),)),
                pro.langcode=="ar"?
                Icon(Icons.done,color: primaryColor,) :
                SizedBox.shrink()
              ],
            )),
          ),      ],
      ),
    );
  }
}
