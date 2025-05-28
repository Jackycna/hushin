import 'package:flutter/material.dart';

import 'package:hushin/core/appimages/app_image.dart';
import 'package:hushin/core/common/widgets/basicapp_button.dart';
import 'package:hushin/data/models/auth/create_user_req.dart';
import 'package:hushin/domain/usecases/auth/signup_usecase.dart';
import 'package:hushin/pages/home/home_page.dart';

import 'package:hushin/service_locator.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Image.asset(AppImage.signupImage),
              SizedBox(height: height * 0.01),
              name(),
              email(),
              password(),

              SizedBox(height: height * 0.01),
              button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget name() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: 'Enter Name',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget email() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
      child: TextField(
        controller: emailcontroller,
        decoration: InputDecoration(
          labelText: 'Enter Email',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget password() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
      child: TextField(
        controller: passwordcontroller,
        decoration: InputDecoration(
          labelText: 'Enter Password',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget button() {
    return Center(
      child: BasicappButton(
        onpressed: () async {
          var result = await sl<SignupUsecase>().call(
            params: CreateUserReq(
              name: nameController.text.toString(),
              email: emailcontroller.text.toString(),
              password: passwordcontroller.text.toString(),
            ),
          );
          result.fold(
            (l) {
              var snackBar = SnackBar(content: Text(l));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            (r) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage(),
                ),
                (route) => false,
              );
            },
          );
        },
        title: 'Sign Up',
      ),
    );
  }
}
