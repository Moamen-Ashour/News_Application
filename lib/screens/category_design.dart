import 'package:coach_nearest/models/category_item.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class category_design extends StatelessWidget {

  CategoryData categoryData;
  int index;
  List<Color> color = [Colors.pink, Colors.green];
  category_design(this.categoryData, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryData.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: index.isEven?Radius.circular(25):Radius.zero,
          bottomRight: index.isOdd?Radius.circular(25):Radius.zero
      )

      ),

      child: ListView(
        children: [
          Image.asset(categoryData.image,height: 100,),
          Center(child: GradientText(categoryData.title, colors: const [
            Colors.white,
            Colors.lightGreenAccent,
            Colors.white
                      ],style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),)
          ),

        ],
      ),
    );
  }
}
