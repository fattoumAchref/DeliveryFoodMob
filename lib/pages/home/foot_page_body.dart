import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysecondapp/pages/food/popular_food_detail.dart';
import 'package:mysecondapp/pages/food/recommanded_food.dart';
import 'package:mysecondapp/widgets/app_column.dart';
import 'package:mysecondapp/widgets/big_text.dart';
import 'package:mysecondapp/dimension.dart';
import 'package:mysecondapp/widgets/excandable_text_widget.dart';
import 'package:mysecondapp/widgets/icon_text_widget.dart';
import 'package:mysecondapp/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  final bool isDarkMode;
  const FoodPageBody({super.key, required this.isDarkMode});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  //see the right and left image
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double scaleFactor = 0.8;
  double _height = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          color: widget.isDarkMode ? Colors.black : Colors.white,
          height: 320,
          child: GestureDetector(
            onTap: () {
              Get.to(() => PopularFoodDetail());
            },
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return _buildPageItem(index);
                })),
          )),
      new DotsIndicator(
        dotsCount: 5,
        position: _currPageValue,
        decorator: DotsDecorator(
          activeColor: Color.fromARGB(255, 125, 226, 172),
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              BigText(
                text: "Popular",
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: BigText(
                  text: ".",
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: SmallText(
                  text: "Food pairing",
                  color: Colors.grey,
                ),
              )
            ],
          )),
      Container(
        height: 1300,
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Get.to(RecomandedFood());
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: Row(
                      children: [
                        //image section
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: widget.isDarkMode
                                ? Color.fromARGB(255, 12, 12, 12)
                                : Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/Images/f1.jpg"),
                            ),
                          ),
                        ),
                        //text container
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: widget.isDarkMode
                                  ? Color.fromARGB(255, 12, 12, 12)
                                  : Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                      text: "Nutritious fruit meal in china",
                                      size: 22,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SmallText(
                                      text: "With chinese characteristics",
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: Colors.amber,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.location_on,
                                          text: "1.72Km",
                                          iconColor: Colors.blue,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.access_alarms_rounded,
                                          text: "32min",
                                          iconColor:
                                              Color.fromARGB(255, 217, 68, 27),
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
            }),
      )
    ]);
  }

  // animate the image
  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (_currPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - scaleFactor) / 2, 1);
    }

    return Transform(
        transform: matrix,
        child: Stack(children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Colors.amber : Colors.purple,
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/Images/f1.jpg")),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 140,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.isDarkMode
                      ? Color.fromARGB(255, 12, 12, 12)
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: widget.isDarkMode
                          ? Color.fromARGB(255, 12, 12, 12)
                          : Colors.white,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: widget.isDarkMode
                          ? Color.fromARGB(255, 12, 12, 12)
                          : Colors.white,
                      offset: Offset(0, 5),
                    )
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: AppColumn(
                  text: "Chinese Side",
                ),
              ),
            ),
          ),
        ]));
  }
}
