import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/cart_page.dart';
import 'package:plant_app/screens/favorite_page.dart';
import 'package:plant_app/screens/home_page.dart';
import 'package:plant_app/screens/profile_page.dart';
import 'package:plant_app/screens/scan_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  int bottomindex = 0;

  List<Plant> favorites = [];
  List<Plant> mycarts = [];


  List<Widget> pages (){
    return [
    const HomePage(),
    FavoritePage(FavoritedPlants: favorites,),
    CartPage(addedToCartPlants: mycarts,),
    const ProfilePage(),
    ];
  }

  List<IconData> iconlist = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];


  @override
  Widget build(BuildContext context) {

    List<String> appbartitle = [
    AppLocale.home.getString(context),
    AppLocale.alaghemandi.getString(context),
    AppLocale.sabad.getString(context),
    AppLocale.profile.getString(context),
  ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notifications,
                color: Constant.blackColor,
                size: 30.0,
              ),
              Text(
                appbartitle[bottomindex],
                style: TextStyle(
                  fontFamily: 'Yekan Bakh',
                  color: Constant.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: bottomindex,
        children: pages(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, PageTransition(
            child: const ScanPage(),
            type: PageTransitionType.bottomToTop,
            ),
          );
        },
        backgroundColor: Constant.primaryColor,
        child: Image.asset(
          "assets/images/13_13.png",
          height: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconlist,
        activeIndex: bottomindex,
        onTap: (index){
          setState(() {
            bottomindex = index;

            final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
            final List<Plant> addedtocartplants = Plant.addedToCartPlants();

            favorites = favoritedPlants.toSet().toList();
            mycarts = addedtocartplants.toSet().toList();
          });
        },
        splashColor: Constant.primaryColor,
        activeColor: Constant.primaryColor,
        inactiveColor: Colors.black.withOpacity(0.5),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
      ),
    );
  }
}