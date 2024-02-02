import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysecondapp/pages/home/login.dart';
import 'package:mysecondapp/widgets/big_text.dart';
import 'package:mysecondapp/pages/home/foot_page_body.dart';
import 'package:mysecondapp/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

void showdialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Are you sure you want to log out"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel")),
            TextButton(
                onPressed: () {
                  Get.to(() => LoginPage());
                },
                child: Text("Logout"))
          ],
        );
      });
}

class _MainFoodPageState extends State<MainFoodPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            // Showing the header
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 45, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          showdialog(context);
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          child: Icon(Icons.exit_to_app, color: Colors.white),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isDarkMode
                                ? Color.fromARGB(255, 30, 31, 30)
                                : Color.fromARGB(255, 159, 244, 190),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        BigText(
                          text: "Delivery Food",
                          color: isDarkMode
                              ? Colors.white
                              : Color.fromARGB(255, 159, 244, 190),
                          size: 30,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: 'Narsgindi',
                              color: isDarkMode
                                  ? Colors.white
                                  : Color.fromARGB(255, 30, 31, 30),
                            ),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDarkMode = !isDarkMode;
                        });
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        child: Icon(Icons.dark_mode, color: Colors.white),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 30, 31, 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Showing the body
            Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(
                  isDarkMode: isDarkMode,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
