import 'package:coach_nearest/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../shared/providers/appbar_icon_search.dart';
import '../shared/providers/appbar_title.dart';

class drawer_scr extends StatelessWidget {

  Function ScreenSelected;


  static  int Cateogry = 0;
  static  int Setting = 1;

  bool isSelected = true;

  drawer_scr(this.ScreenSelected);

  @override
  Widget build(BuildContext context) {


    return Drawer(

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              child: Center(child: Text(AppLocalizations.of(context)!.sidebar,style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),)),
              decoration: BoxDecoration(
                color: Colors.green
              ),
            ),
          header(context),
          menuItems(context)
          ]
        ),
      ),
    );
  }

  Widget header(BuildContext context) {


    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
  }
  Widget menuItems(BuildContext context) {
    var appbar_titl = Provider.of<appbar_title>(context);
    var search_Icon = Provider.of<search_icon>(context);
    Widget appBarTitle = Text(appbar_titl.changeTitle(AppLocalizations.of(context)!.home));
    return Container(
       child: Wrap(
         runSpacing: 16,  // vertical spacing between items
         children: [
         ListTile(
           leading: Icon(Icons.home),
           title:Text(AppLocalizations.of(context)!.home),
           onTap: (){
              ScreenSelected(Cateogry);
              search_icon.iconSearch = Icon(Icons.search);
           },
         ),
         Divider(color: Colors.black,),
         ListTile(
           leading: Icon(Icons.settings),
           title:Text(AppLocalizations.of(context)!.setting),
           onTap: (){
             ScreenSelected(Setting);
             search_icon.iconSearch = Icon(Icons.settings);
             },
         ),
           Divider(color: Colors.black,),
           ListTile(
             leading: Icon(Icons.search),
             title:Text(AppLocalizations.of(context)!.searchtitle),
             onTap: (){
              Navigator.push(context,  MaterialPageRoute(builder: (context)=>SearchPage()));
               search_icon.iconSearch = Icon(Icons.search);
             },
           ),
           Divider(color: Colors.black,),
         ],
       ),
    );
  }
}
