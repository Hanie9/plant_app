import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:plant_app/const/constants.dart';

class About_Us extends StatefulWidget {
  const About_Us({super.key});

  @override
  State<About_Us> createState() => _About_UsState();
}

class _About_UsState extends State<About_Us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Constant.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              left: 0.0,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              child: Text(
                AppLocale.aboutus.getString(context),
                style: const TextStyle(
                  fontFamily: 'iransans'
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              AppLocale.mamooriat.getString(context),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Yekan Bakh",
              ),
            ),
            const SizedBox(height: 10),
            Text(
              AppLocale.desMamooriat.getString(context),
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: "iransans",
              ),
            ),
            const SizedBox(height: 40),
            Text(
              AppLocale.maCheKasaniHastim.getString(context),
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Yekan Bakh",
              ),
            ),
            const SizedBox(height: 10),
            Text(
              AppLocale.desMaCheKasaniHastim.getString(context),
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: "iransans",
              ),
            ),
          ],
        ),
      ),
    );
  }
}