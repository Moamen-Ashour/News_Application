import 'package:coach_nearest/screens/category_design.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/category_item.dart';

class category_screen extends StatelessWidget {

  Function CategorySelecte;

  category_screen(this.CategorySelecte);

  @override
  Widget build(BuildContext context) {


    var Category_data = CategoryData.getCategories(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: double.infinity,
              color: Colors.white38,
              child: Center(
                child: GradientText(AppLocalizations.of(context)!.select_category,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold), colors: const [
                  Colors.black,
                  Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.black,Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.black,Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.black,Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.blueGrey,  Colors.black,
                  Colors.black,
                ],),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: Category_data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12
                ), itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                     CategorySelecte(Category_data[index]);  // callback function to send category when user click on it
                  },
                  child: category_design(Category_data[index], index),
                );
            }),
          )
        ],
      ),
    );
  }

}
