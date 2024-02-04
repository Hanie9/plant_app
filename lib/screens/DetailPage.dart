import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/cart_page.dart';
import 'package:plant_app/widgets/extensions.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool toggleisselected(bool isSelected){
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;
    
    return Scaffold(
      body: Stack(
        children: [
          //Appbar
          Positioned(
            top: 71.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // x button
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Constant.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constant.primaryColor,
                    ),
                  ),
                ),
                // Like button
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constant.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    plantList[widget.plantId].isFavorated == true ? Icons.favorite : Icons.favorite_border,
                    color: Constant.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              width: size.width * (0.8),
              height: size.height * (0.8),
              child: Stack(
                children: [
                  // product image
                  Positioned(
                    top: 30.0,
                    left: 0.0,
                    child: SizedBox(
                      height: 350.0,
                      child: Image.asset(plantList[widget.plantId].imageURL),
                    ),
                  ),
                  // plant feature
                  Positioned(
                    top: 30.0,
                    right: 0.0,
                    child: SizedBox(
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PlantFeature(
                            title: 'اندازه گیاه',
                            plantFeature: plantList[widget.plantId].size,
                          ),
                          PlantFeature(
                            title: 'رطوبت‌هوا',
                            plantFeature: plantList[widget.plantId].humidity.toString().farsiNumber,
                          ),
                          PlantFeature(
                            title: 'دمای‌نگه‌داری',
                            plantFeature: plantList[widget.plantId].temperature.toString().farsiNumber,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.only(top: 80.0, right: 30.0, left: 30.0),
              height: size.height * (0.5),
              width: size.width,
              decoration: BoxDecoration(
              color: Constant.primaryColor.withOpacity(0.5),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: Constant.primaryColor,
                          ),
                          Text(
                            plantList[widget.plantId].rating.toString().farsiNumber,
                            style: TextStyle(
                              color: Constant.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 23.0,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            plantList[widget.plantId].plantName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Constant.primaryColor,
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 19.0,
                                child: Image.asset('assets/images/7_7.png'),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                plantList[widget.plantId].price.toString().farsiNumber,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: Constant.blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    plantList[widget.plantId].decription,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Constant.blackColor.withOpacity(0.7),
                      height: 1.6,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50.0,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, PageTransition(
                  child: CartPage(addedToCartPlants: Plant.addedToCartPlants()),
                  type: PageTransitionType.bottomToTop,
                  ),
                );
              },
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Constant.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 1.1),
                      blurRadius: 5.0,
                      color: Constant.primaryColor.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Badge(
                  backgroundColor: Constant.primaryColor.withOpacity(0.6),
                  isLabelVisible: Plant.addedToCartPlants().isEmpty ? false : true,
                  label: Text(
                    Plant.addedToCartPlants().length.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.shopping_cart,
                      color: Plant.addedToCartPlants().isEmpty ? Colors.white : Colors.green[900],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Constant.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 1.1),
                      blurRadius: 5.0,
                      color: Constant.primaryColor.withOpacity(0.3),
                    ),
                  ]
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.primaryColor
                  ),
                  onPressed: () {
                    setState(() {
                      bool isSelected = toggleisselected(plantList[widget.plantId].isSelected);
                      plantList[widget.plantId].isSelected = isSelected;
                    });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            padding: const EdgeInsets.all(10.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            behavior: SnackBarBehavior.fixed,
                            content: Center(
                              child: Text(
                                'گیاه ${plantList[widget.plantId].plantName} با موفقیت به سبد‌خرید اضافه شد',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                  child: const Text(
                    "افزودن‌به‌سبد‌خرید",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {

  final String title;
  final String plantFeature;

  const PlantFeature({
    super.key, required this.title, required this.plantFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constant.blackColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constant.primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}