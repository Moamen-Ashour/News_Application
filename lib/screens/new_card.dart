import 'package:blur/blur.dart';
import 'package:coach_nearest/generated/assets.dart';
import 'package:coach_nearest/models/json_api_news/NewData.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

class new_card extends StatefulWidget {

  Articles article;

  // should send one article from tab_controller by removing title and just but news[index]
  new_card(this.article);

  @override
  State<StatefulWidget> createState() {
    return _new_cardState();
  }
}

class _new_cardState extends State<new_card> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
       color: Colors.white54,
        border: Border.all(color: Color(0xff5f967c),
          width: 3
        ),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white54,
                  border: Border.all(color: Colors.black,
                      width: 3
                  ),
                  borderRadius: BorderRadius.circular(1)
              ),
              child: CachedNetworkImage(
                  placeholder: (context,url)=> Lottie.asset(Assets.jsonLottieLoadingImage),
                  errorWidget: (context,url,error)=> Lottie.asset(Assets.jsonLottieError),
                  imageUrl: widget.article.urlToImage??"")),
          Text(widget.article.author??"",style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade500
          ),
          ),
          Text(widget.article.title??"",style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87
          ),
          ),
          Text(widget.article.publishedAt?.substring(0,10)??"",textAlign: TextAlign.right,),
        ],
      ),
    );
  }
}
