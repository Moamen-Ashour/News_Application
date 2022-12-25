import 'package:flutter/material.dart';

class drawer_scr extends StatelessWidget {

  Function ScreenSelected;

  static const List<int> Screens =  [
    0 // category
   ,1  // settings ];
  ];

  static const int Cateogry = 0;
  static const int Setting = 1;

  bool isSelected = true;

  drawer_scr(this.ScreenSelected);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
    return Container(
       child: Wrap(
         runSpacing: 16,  // vertical spacing between items
         children: [
         ListTile(
           leading: Icon(Icons.home),
           title:Text("Home"),
           onTap: (){
              ScreenSelected(Cateogry);
           },
         ),
         Divider(color: Colors.black,),
         ListTile(
           leading: Icon(Icons.settings),
           title:Text("Settings"),
           onTap: (){
             ScreenSelected(Setting);
               },
         )
         ],
       ),
    );
  }
}
