import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plant_app/screens/camera_page.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
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
                // share button
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constant.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    Icons.share,
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
            child: SizedBox(
              width: size.width * (0.8),
              height: size.height * (0.8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                          child: const Camerapage(),
                          type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/11_11.png',
                        height: 100.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      AppLocale.scan.getString(context),
                      style: TextStyle(
                        color: Constant.primaryColor.withOpacity(0.8),
                        fontFamily: 'iransans',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}