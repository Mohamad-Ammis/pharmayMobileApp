// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/controller/cartPageController/cart_controller.dart';
import 'package:flutter_application_2/profile/DetailsList.dart';
import 'package:flutter_application_2/profile/HelpCenterList.dart';
import 'package:flutter_application_2/profile/SwitchDarkMode.dart';
import 'package:flutter_application_2/profile/driver.dart';
import 'package:get/get.dart';
import '../../main.dart';
import 'infoCard.dart';

List languagesList = ["English", "Arabic"];

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Container(
                //height: MediaQuery.of(context).size.height / 10,
                //width: MediaQuery.of(context).size.width * 0.95,
                margin: const EdgeInsets.only(
                    top: 50, left: 10, right: 10, bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kBorderColor, width: 0.5),
                ),
                child: InfoCard(
                  name: "User Name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: DetailsList(),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: GetBuilder<CartController>(
                  init: CartController(),
                  builder: (controller) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: kSecondryTextColor,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Settings",
                              style: TextStyle(
                                  color: kSecondryTextColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Language",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              onTap: () {
                                controller.changeArr();
                              },
                              child: Icon(controller.selectedArr
                                  ? Icons.arrow_right
                                  : Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                        subtitle: Container(
                          child: !controller.selectedArr
                              ? Column(
                                  children: [
                                    RadioListTile(
                                        fillColor: MaterialStatePropertyAll(b),
                                        title: Text('English'),
                                        value: languagesList[0],
                                        groupValue: controller.currentLanguage,
                                        onChanged: (value) {
                                          setState(() {
                                            controller.currentLanguage =
                                                value.toString();
                                          });
                                        }),
                                    RadioListTile(
                                        fillColor: MaterialStatePropertyAll(b),
                                        title: Text('Arabic'),
                                        value: languagesList[1],
                                        groupValue: controller.currentLanguage,
                                        onChanged: (value) {
                                          setState(() {
                                            controller.currentLanguage =
                                                value.toString();
                                          });
                                        }),
                                  ],
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 6),
                                  child: Text(
                                    controller.currentLanguage,
                                  ),
                                ),
                        ),
                      ),
                      driverr(),
                      SwitchDarkMode(),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: HelpCentreList(),
            ),
          ],
        ),
      ),
    );
  }
}
