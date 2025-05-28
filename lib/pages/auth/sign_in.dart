import 'package:flutter/material.dart';
import 'package:hushin/core/appimages/app_image.dart';
import 'package:hushin/core/common/widgets/basicapp_button.dart';
import 'package:hushin/data/models/auth/signin_user_req.dart';
import 'package:hushin/domain/usecases/auth/signin_usecase.dart';
import 'package:hushin/pages/home/home_page.dart';
import 'package:hushin/service_locator.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [SizedBox(width: width * 0.02), topicon()],
            ),
            SizedBox(height: height * 0.03),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: width * 0.09),
                Text(
                  'Welcome \nBack!',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(
              height: height * 0.3,
              child: Stack(
                children: [
                  Positioned(child: Image.asset(AppImage.signinImage)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 25,
                right: 25,
                bottom: 10,
              ),
              child: Expanded(
                child: TextField(
                  controller: emailcontroller,

                  decoration: InputDecoration(
                    labelText: 'Enter Email',

                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 25,
                right: 25,
                bottom: 10,
              ),
              child: Expanded(
                child: TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),

            Padding(padding: const EdgeInsets.only(top: 30), child: button()),
          ],
        ),
      ),
    );
  }

  Widget topicon() {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  Widget button() {
    return Center(
      child: BasicappButton(
        onpressed: () async {
          var result = await sl<SigninUsecase>().call(
            params: SigninUserReq(
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
        title: 'Sign In',
      ),
    );
  }
}
