import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';

import 'custom_card_body.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.product,  this.suffixIcon});
final Product product;
final IconButton? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //height: 100,
        width: MediaQuery.of(context).size.width,
        child: CustomCardBody(
          product:product,
          suffixIcon:suffixIcon,
        ));
  }
}
