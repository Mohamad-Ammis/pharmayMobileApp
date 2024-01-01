import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';

import '../../constans.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.25,
        maxHeight: MediaQuery.of(context).size.width * 0.3,
      ),
      child: Container(
        //color: kSecondryColor,
        //padding: const EdgeInsets.symmetric(vertical: 8),
        child: product.image??Image.asset('assets/prodImage/41.jpg',fit: BoxFit.fill,),
      ),
    );
  }
}
