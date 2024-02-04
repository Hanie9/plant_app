import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            // profile image
            Container(
              width: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constant.primaryColor.withOpacity(0.5),
                  width: 5.0,
                )
              ),
              child: const CircleAvatar(
                radius: 65.0,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage('assets/images/10_10.jpg'),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            // profile name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ساناز امینی',
                  style: TextStyle(
                    color: Constant.blackColor,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                SizedBox(
                  height: 20.0,
                  child: Image.asset('assets/images/9_9.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            // profile email
            Text(
              'sanaz@gmail.com',
              style: TextStyle(
                color: Constant.blackColor.withOpacity(0.4),
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            // profile options
            SizedBox(
              height: size.height * (0.4),
              width: size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // back button
                  BuildOptions(icon: Icons.person, title: 'پروفایل من',),
                  BuildOptions(icon: Icons.settings, title: 'تنظیمات',),
                  BuildOptions(icon: Icons.notifications, title: 'اطلاع رسانی‌ها',),
                  BuildOptions(icon: Icons.share, title: 'شبکه‌های اجتماعی',),
                  BuildOptions(icon: Icons.logout, title: 'خروج',),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}