
import 'package:daily_tasks5/constant/color.dart';
import 'package:daily_tasks5/provider/my_provider.dart';
import 'package:daily_tasks5/screens/buttom_sheet/theming_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../buttom_sheet/Language_buttom_sheet.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: mintGreen,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.lang,style: TextStyle(
              fontWeight: FontWeight.w500


            ),),
            SizedBox(

              height: MediaQuery.of(context).size.height*.02,
            ),
            Container(
              margin: EdgeInsets.all(8),
              //padding: EdgeInsets.all(6),
              height: 30,
              width: double.infinity,

                decoration: BoxDecoration(
             //     borderRadius: BorderRadius.circular(18),
                  border:Border.all(
                    color: primaryColor
                  )
                ),
                child: Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        pro.langcode=="en"?
                            "English":
                            "العربية"
                      ),
                    )),
                    InkWell(
                        onTap: () {
                          languageButtomSheet();
                        },
                        child: Icon(Icons.arrow_drop_down))
                  ],
                )),
            SizedBox(

              height: MediaQuery.of(context).size.height*.02,
            ),
            Text(AppLocalizations.of(context)!.mode,style: TextStyle(
                fontWeight: FontWeight.w500


            ),),
            SizedBox(

              height: MediaQuery.of(context).size.height*.02,
            ),
            Container(
                margin: EdgeInsets.all(8),
                height: 30,
                width: double.infinity,

                decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(18),
                    border:Border.all(
                        color: primaryColor
                    )
                ),
                child: Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "Light"

                      ),
                    )),
                    InkWell(

                        onTap: () {
                          themingButtomSheet();
                        },
                        child: Icon(Icons.arrow_drop_down))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  languageButtomSheet(){
    showModalBottomSheet(
      context:  context,
      builder: (context) => LanguageButtomSheet(),);
  }
  themingButtomSheet(){
    showModalBottomSheet(
      context:  context,
      builder: (context) => ThemingButtomSheet(),);
  }
}
