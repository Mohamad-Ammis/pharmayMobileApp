import 'package:flutter/material.dart';

import '../../constans.dart';

class ShowProductStyle extends StatelessWidget {
  const ShowProductStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: 400,
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    color: Colors.white,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: const BoxDecoration(
                        color: kSecondryColor,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(75))),
                  )
                ],
              ),
              Center(
                  child: Image.asset(
                'assets/images/pillsone.png',
                width: 300,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
