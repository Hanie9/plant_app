import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';

class BuildOptions extends StatelessWidget {
  final IconData icon;
  final String title;
  const BuildOptions({
    super.key, required this.icon, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 16.0,
            color: Constant.blackColor.withOpacity(0.4),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Yekan Bakh',
                  color: Constant.blackColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Icon(
                icon,
                color: Constant.blackColor.withOpacity(0.5),
                size: 23.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}