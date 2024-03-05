import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:plant_app/const/constants.dart';

class feedback extends StatefulWidget {
  const feedback({super.key});

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {

  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

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
                AppLocale.yourfeedbacks.getString(context),
                style: const TextStyle(
                  fontFamily: 'iransans'
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                AppLocale.titreBazkhord.getString(context),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: "Yekan Bakh",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  maxLines: 5,
                  controller: _controller,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    labelText: AppLocale.lableBazkhord.getString(context),
                    labelStyle: const TextStyle(
                      fontFamily: "iransans",
                      fontWeight: FontWeight.w300,
                    )
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocale.errorBazkhord.getString(context);
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppLocale.matnesnackbar.getString(context),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontFamily: "iransans",
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  AppLocale.ersal.getString(context),
                  style: const TextStyle(
                    fontFamily: "iransans",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}