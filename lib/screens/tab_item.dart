import 'package:coach_nearest/models/json_api_sources/sources_api.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';



class Tab_Item extends StatelessWidget {
  Sources sources;
  bool isSelected;

  Tab_Item(this.sources, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      decoration: BoxDecoration(
          color: isSelected ? Color(0xff3a4c40) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected?Colors.white:Colors.green)),
      child: Text(
        sources.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xff3a4c40),
        ),
      ),
    );
  }
}
