import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysecondapp/pages/home/main_food_page.dart';
import 'package:mysecondapp/widgets/app_icon.dart';
import 'package:mysecondapp/widgets/big_text.dart';
import 'package:mysecondapp/widgets/excandable_text_widget.dart';

class RecomandedFood extends StatelessWidget {
  const RecomandedFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false, //standar button remove
              toolbarHeight: 80,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => MainFoodPage());
                    },
                    child: AppIcon(icon: Icons.clear),
                  ),
                  AppIcon(icon: Icons.add_shopping_cart_outlined),
                ],
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(30),
                  child: Container(
                    child: Center(
                      child: BigText(text: "chinese side"),
                    ),
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                  )),
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/Images/f1.jpg",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: ExcandableText(
                        text:
                            "This is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.This is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.This is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.This is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment.This is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, payment."),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              padding:
                  EdgeInsets.only(left: 70, right: 70, top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.remove,
                    iconColor: Color.fromARGB(255, 247, 250, 248),
                    backgroundColor: Color.fromARGB(255, 115, 251, 176),
                  ),
                  BigText(
                    text: "\$12.88 X 0",
                    size: 28,
                  ),
                  AppIcon(
                    icon: Icons.add,
                    iconColor: Color.fromARGB(255, 239, 246, 243),
                    backgroundColor: Color.fromARGB(255, 110, 246, 187),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 20),
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 233, 230, 230),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.favorite,
                    color: Color.fromARGB(255, 129, 238, 191),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 133, 249, 193),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: BigText(
                    text: "£28|Add to cart",
                    size: 22,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
