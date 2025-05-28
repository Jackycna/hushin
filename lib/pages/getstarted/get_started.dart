import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hushin/core/appimages/app_image.dart';
import 'package:hushin/core/colors/app_colors.dart';
import 'package:hushin/core/common/widgets/basicapp_button.dart';
import 'package:hushin/pages/auth/sign_in.dart';
import 'package:hushin/pages/auth/sign_up.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: height * 0.05,
            left: width * 0.05,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: 30),
            ),
          ),
          Positioned(
            top: height * 0.4,
            left: width * 0.08,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: height * 0.09,
                width: width * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Quality',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.2,
            left: width * 0.5,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: height * 0.09,
                width: width * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Freshness',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.5,
            left: width * 0.3,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: height * 0.09,
                width: width * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Trust',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.2,
            left: width * 0.02,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: height * 0.09,
                width: width * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Safety',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.6,
            left: width * 0.7,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: height * 0.09,
                width: width * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Reliability',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.6,
            left: width * 0.05,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: height * 0.09,
                width: width * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Care',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.4,
            left: width * 0.7,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: height * 0.09,
                width: width * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Honesty',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.7,
            left: width * 0.02,
            child: Text(
              'Your Growth Engine Starts Here',

              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: height * 0.15,
            left: width * 0.10,
            child: BasicappButton(
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignIn()),
                );
              },
              title: 'Sign In',
            ),
          ),
          Positioned(
            bottom: height * 0.15,
            right: width * 0.10,
            child: BasicappButton(
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignUp()),
                );
              },
              title: 'Sign Up',
            ),
          ),
        ],
      ),
    );
  }
}
