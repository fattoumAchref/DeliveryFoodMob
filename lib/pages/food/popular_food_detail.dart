import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysecondapp/pages/home/main_food_page.dart';
import 'package:mysecondapp/widgets/app_column.dart';
import 'package:mysecondapp/widgets/app_icon.dart';
import 'package:mysecondapp/widgets/excandable_text_widget.dart';

import '../../widgets/big_text.dart';
import '../../widgets/icon_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/Images/f1.jpg"),
              )),
            ),
          ),
          //icon Widget
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(() => MainFoodPage());
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios)),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            top: 300,
            bottom: 1,
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Chinese Side"),
                    SizedBox(
                      height: 10,
                    ),
                    BigText(
                      text: "Introduce",
                      size: 22,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExcandableText(
                            text:
                                "This is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.This is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment."),
                      ),
                    ),
                  ],
                )),
          ),
          //expandable text widget
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        height: 100,
        decoration: BoxDecoration(
            color: Color.fromARGB(221, 244, 242, 242),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  BigText(
                    text: "0",
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
              child: BigText(
                text: "10£ Add to cart",
                size: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 134, 235, 190),
              ),
            )
          ],
        ),
      ),
    );
  }
}
