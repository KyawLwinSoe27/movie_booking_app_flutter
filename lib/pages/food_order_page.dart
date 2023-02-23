import 'package:flutter/material.dart';
import 'package:movie_booking_app/functions/reuse_functions.dart';

import '../common_widgets/back_to_widget.dart';
import '../resources/colors.dart';
import '../resources/dimensions.dart';
import '../resources/strings.dart';
import 'checkout.dart';

class FoodOrder extends StatelessWidget {
  List<String> foodCategories = [
    "All",
    "Combo",
    "Snack",
    "Pop Corn",
    "Beverage"
  ];
  FoodOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        leading: BackToWidget(),
        title: Text(
          TITLE_TEXT,
          style: TextStyle(
              fontSize: LOGIN_SCREEN_MAIN_TEXT_SIZE,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: MARGIN_SMALL_4X,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                router(context, CheckOutPage());
              },
              child: Text(
                ACTIONS_TEXT,
                style: TextStyle(
                    fontSize: LOGO_TXT_FONT_SIZE, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            width: MARGIN_SMALL_20,
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: MARGIN_SMALL_2X),
        child: Column(
          children: [
            Container(
              child: DefaultTabController(
                length: foodCategories.length,
                child: TabBar(
                  onTap: (index) {
                    print(index);
                  },
                  isScrollable: true,
                  tabs: foodCategories
                      .map(
                        (foodCategory) => Tab(
                          text: foodCategory,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            SnackItemsWidget(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 22,vertical: 15),
              decoration: BoxDecoration(
                color: PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                child: Row(
                  children: [
                    Icon(Icons.fastfood),
                    SizedBox(width: 15,),
                    GestureDetector(onTap: () {
                      showModalBottomSheet(context: context, builder: (BuildContext context) {
                        return FoodSummaryWidget();
                      },
                      );
                    },child: Icon(Icons.keyboard_arrow_down_outlined)),
                    Spacer(),
                    Text("2000Ks",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700),),
                    SizedBox(width: 8,),
                    GestureDetector(onTap: () {router(context,CheckOutPage());},child: Icon(Icons.chevron_right,color: Colors.black,size: 30,)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SnackItemsWidget extends StatefulWidget {
  const SnackItemsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SnackItemsWidget> createState() => _SnackItemsWidgetState();
}

class _SnackItemsWidgetState extends State<SnackItemsWidget> {
  final snack = [
    Snack("images/food.png", "Potato Chips", 1000),
    Snack("images/food.png", "Cocacola Large", 1000),
    Snack("images/food.png", "Large Pepsi", 1100),
    Snack("images/food.png", "Burger Combo2", 5500),
    Snack("images/food.png", "Pizza", 10000),
    Snack("images/food.png", "Burger Combo2", 5000),
    Snack("images/food.png", "Medium Burger", 5000),
    Snack("images/food.png", "KFC Combo 1", 8000),
    Snack("images/food.png", "Pop Corn Small", 1000),
    Snack("images/food.png", "Pop Corn Medium", 2000),
  ];
  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MARGIN_SMALL_30,
          left: MARGIN_SMALL_25,
          right: MARGIN_SMALL_25),
      height: 574,
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: MARGIN_SMALL_25,
                mainAxisSpacing: MARGIN_SMALL_25,
                childAspectRatio: 0.77),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MARGIN_SMALL_8),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [LOGO_TXT_COLOR, FOOD_ITEM_BG_BOOTOM_COLOR],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 13, left: 10, bottom: 11, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 23),
                         child: Image.asset(
                        snack[index].snackImage,
                        width: 100,
                        height: 100,
                      )),
                      SizedBox(height: MARGIN_SMALL_2X,),
                      Container(
                         child: Text(
                        snack[index].snackName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )),
                      SizedBox(height: MARGIN_SMALL_1X,),
                      Container(
                          child: Text(
                        "${snack[index].price}Ks",
                        style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )),
                      SizedBox(height: MARGIN_SMALL_2X,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            total += 1;
                          });
                          print(index);
                        },
                        child: total < 1 ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: PRIMARY_COLOR,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 50),
                            child: Text("ADD"),
                          ),
                        ) : Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.add_circle,color: PRIMARY_COLOR,),
                              SizedBox(width: 15,),
                              Text("${total}",style: TextStyle(color: PRIMARY_COLOR),),
                              SizedBox(width: 15,),
                              GestureDetector(onTap: () {
                                setState(() {
                                  total -= 1;
                                });
                              },child: Icon(Icons.remove_circle,color: PRIMARY_COLOR,)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}

class FoodSummaryWidget extends StatelessWidget {
  const FoodSummaryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: BACKGROUND_COLOR,
        borderRadius: BorderRadius.only(topRight: Radius.circular(MARGIN_SMALL_20),topLeft: Radius.circular(MARGIN_SMALL_20)),
      ),
      child: Column(
        children: [
          SizedBox(height: 25,),
          OrderItemWidget(),
          SizedBox(height: 25,),
          OrderItemWidget(),
          SizedBox(height: 17,),
          FoodConfirmButton()
        ],
      ),
    );
  }
}

class FoodConfirmButton extends StatelessWidget {
  const FoodConfirmButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22,vertical: 15),
      decoration: BoxDecoration(
        color: PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        child: Row(
          children: [
            Icon(Icons.fastfood),
            SizedBox(width: 15,),
            GestureDetector(onTap: () {Navigator.pop(context);},child: Icon(Icons.keyboard_arrow_up_outlined)),
            Spacer(),
            Text("2000Ks",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700),),
            SizedBox(width: 8,),
            GestureDetector(onTap: () {router(context,CheckOutPage());},child: Icon(Icons.chevron_right,color: Colors.black,size: 30,)),
          ],
        ),
      ),
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          Text("Large Cola",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white),),
          Spacer(),
          Icon(Icons.add_circle,color: PRIMARY_COLOR,),
          SizedBox(width: 13,),
          Text("1",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
          SizedBox(width: 13,),
          Icon(Icons.remove_circle,color: PRIMARY_COLOR,),
          Spacer(),
          Text("1000Ks",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),),
        ],
      ),
    );
  }
}

class Snack {
  String snackImage;
  String snackName;
  int price;
  Snack(this.snackImage,this.snackName,this.price);
}

