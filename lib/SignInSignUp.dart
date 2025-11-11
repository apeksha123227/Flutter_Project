import 'package:flutter/material.dart';
import 'package:flutter_practice/CommonFunctions.dart';
import 'package:svg_image/svg_image.dart';

import 'SignIn.dart';

class SignInSignUp extends StatefulWidget {
  const SignInSignUp({super.key});

  @override
  State<SignInSignUp> createState() => _SignInSignUpState();
}

class _SignInSignUpState extends State<SignInSignUp> {
  @override
  Widget build(BuildContext context) {
    final screen_Width = MediaQuery.of(context).size.width;
    final screen_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screen_Width,
        height: screen_Height,
        child: Column(
          children: [
            SvgImage(
              'assets/images/background.svg',
              type: PathType.assets,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      "Welcome",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.start,
                      "Lorem ipsum dolor sit amet consectetur.\nLorem id sit ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      ),
                    ),
                    //SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            "Continue ",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 5,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                            },
                            child: SvgImage(
                              "assets/images/nextpage_icon.svg",
                              type: PathType.assets,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
