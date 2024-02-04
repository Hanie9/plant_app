import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/extensions.dart';
import 'package:plant_app/widgets/plantWidget.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addedToCartPlants;
  const CartPage({super.key, required this.addedToCartPlants,});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List<Plant> plantList = Plant.addedToCartPlants();

  @override
  Widget build(BuildContext context) {

  int totalPrice = 0;
  for (var plant in Plant.addedToCartPlants()) {
    totalPrice += plant.price;
  }

    return Scaffold(
      body: widget.addedToCartPlants.isEmpty ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.0,
              child: Image.asset('assets/images/8_8.png'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'سبد خرید تار عنکبوت بسته است :(',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ) : Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.addedToCartPlants.length,
                itemBuilder: (context, index) {
                  return NewPlantWidget(
                    plantList: widget.addedToCartPlants,
                    index: index,
                  );
                },
              ),
            ),
            Column(
              children: [
                const Divider(
                  thickness: 1.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 20.0,
                          child: Image.asset("assets/images/7_7.png"),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        // bayad jam gheymata hesab she!!!
                        Text(
                          totalPrice.toString().farsiNumber,
                          style: TextStyle(
                            color: Constant.primaryColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'جمع کل',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}