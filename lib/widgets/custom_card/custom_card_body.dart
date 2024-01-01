import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/models/product.dart';

import 'custom_card_image.dart';
import 'custom_card_info.dart';

class CustomCardBody extends StatelessWidget {
  const CustomCardBody(
      {super.key,
      required this.product,  this.suffixIcon});
  final Product product;
  final IconButton? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      elevation: 5,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image
          CustomCardImage(
            product:product
          ),
          SizedBox(width: 20,),
          CustomCardInfo(
            product:product
          ),
         suffixIcon??Container()
        ],
      ),
    );
  }
}
