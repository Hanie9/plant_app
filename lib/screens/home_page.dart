import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/DetailPage.dart';
import 'package:plant_app/widgets/extensions.dart';
import 'package:plant_app/widgets/plantWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedindex = 0;

  final List<Plant> _plantList = Plant.plantList;

  bool toggleIsFavorite(bool isFavorite){
    return !isFavorite;
  }



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    final List<String> _plantTypes = [
    AppLocale.pishnahadi.getString(context),
    AppLocale.apartemani.getString(context),    
    AppLocale.mahaleKar.getString(context), 
    AppLocale.baghche.getString(context), 
    AppLocale.sammi.getString(context), 
  ];


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Constant.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  width: size.width * 0.9,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.mic,
                      ),
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                            showCursor: false,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(right: 5.0),
                              hintText: AppLocale.search.getString(context),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintStyle: const TextStyle(
                                fontFamily: 'iransans',
                              )
                            ),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.search,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              height: 70.0,
              width: size.width,
              child: ListView.builder(
                reverse: true,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedindex = index;
                        });
                      },
                      child: Text(
                        _plantTypes[index],
                        style: TextStyle(
                          fontFamily: 'Yekan Bakh',
                          fontSize: 16.0,
                          fontWeight: selectedindex == index ? FontWeight.bold : FontWeight.w300,
                          color: selectedindex == index ? Constant.primaryColor : null,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _plantTypes.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            // Product 1
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: _plantList.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, PageTransition(
                        child: DetailPage(plantId: _plantList[index].plantId,),
                        type: PageTransitionType.bottomToTop,
                        ),
                      );
                    },
                    child: Container(
                      width: 200.0,
                      margin: const EdgeInsets.symmetric(horizontal: 18.0),
                      decoration: BoxDecoration(
                        color: Constant.primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10.0,
                            right: 20.0,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: IconButton(
                                onPressed: (){
                                  setState(() {
                                    bool isFavorated = toggleIsFavorite(_plantList[index].isFavorated);
                                    _plantList[index].isFavorated = isFavorated;
                                  });
                                },
                                icon: Icon(
                                  _plantList[index].isFavorated == true ? Icons.favorite : Icons.favorite_border_outlined,
                                  color: Constant.primaryColor,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50.0,
                            right: 50.0,
                            bottom: 50.0,
                            left: 50.0,
                            child: Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 15.0,
                            left: 20.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Text(
                                '${_plantList[index].price.toString().farsiNumber}ت',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  color: Constant.primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15.0,
                            right: 20.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  _plantList[index].category,
                                  style: const TextStyle(
                                    fontFamily: 'iransans',
                                    fontSize: 14.0,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  _plantList[index].plantName,
                                  style: const TextStyle(
                                    fontFamily: 'Yekan Bakh',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            //new plants text
            Container(
              padding: const EdgeInsets.only(right: 25.0, top: 20.0, bottom: 15.0),
              alignment: Alignment.centerRight,
              child: Text(
                AppLocale.newplants.getString(context),
                style: const TextStyle(
                  fontFamily: 'iransans',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //new plants product 2
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              height: size.height * (0.3),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _plantList.length,
                itemBuilder: (context, index){
                  return NewPlantWidget(plantList: _plantList, index: index,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}