import 'package:flutter/material.dart';
import 'package:flutter_practice/CommonFunctions.dart';
import 'package:svg_image/svg_image.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Column(children: [Container(color: Colors.black)]),
              SvgImage(
                'assets/images/background.svg',
                type: PathType.assets,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
