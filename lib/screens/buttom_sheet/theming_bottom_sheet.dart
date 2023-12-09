import 'package:daily_tasks5/constant/color.dart';
import 'package:daily_tasks5/provider/my_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ThemingButtomSheet extends StatelessWidget {

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

                pro.changeThem(ThemeMode.light);

            },
            child: Container(child: Row(
              children: [
                Expanded(child: Text(AppLocalizations.of(context)!.light,
                  style: TextStyle(

                  color:
                  pro.mode==ThemeMode.light?
                  primaryColor:
                  Colors.black
                ),)),
                pro.mode==ThemeMode.dark?
                  SizedBox.shrink()   :
                Icon(Icons.done,color: primaryColor,)

              ],
            )),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              pro.changeThem(ThemeMode.dark);

            },
            child: Container(child: Row(
              children: [
                Expanded(child: Text(AppLocalizations.of(context)!.dark,
    style: TextStyle(

    color:
    pro.mode==ThemeMode.light?
    Colors.black:
    Colors.white

    ),)),
                pro.mode==ThemeMode.dark?
                Icon(Icons.done,color:
                pro.mode==ThemeMode.light?
                primaryColor:
                Colors.white
                )        :
              SizedBox.shrink()
              ],
            )),
          ),      ],
      ),
    );
  }
}
