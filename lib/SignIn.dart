import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'AppColors.dart';
import 'SignUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool hidePassword = true;
  final formkey=GlobalKey<FormState>();
  late String strPassword;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    String strGetPassword =
        ModalRoute.of(context)!.settings.arguments as String;

      void login() {
        strPassword = password.text;
/*
      if (strPassword == strGetPassword) {
        Navigator.pushNamed(context, '/display', arguments: "Welcome");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login Success")));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Something went wrong")));
      }*/
        if (formkey.currentState!.validate()) {
          Navigator.pushNamed(context, '/display', arguments: "Welcome");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Login Success")));
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Something went wrong ")),
          );
        }
      }

    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Stack(

            children: [
              SizedBox(height: 500,
                child: Image.asset('assets/images/back.png', width: screenWidth,
                  fit: BoxFit.fitWidth,),),
              Column(
                children: [
                  SizedBox(height: 400,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: Divider(color: Colors.pink, thickness: 2),
                        ),
                        SizedBox(height: 30),

                        Text(
                          "Email ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextFormField(
                          controller: email,
                          maxLines: 1,
                          cursorColor: Colors.pink,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "ape@gmail.com",
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            prefixIcon: Icon(Icons.email_outlined),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink),
                            ),
                          ),
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return 'Please enter Email';
                            }
                            else if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                              return 'Enter a valid email';
                            }
                            return null;
                          },

                        ),

                        SizedBox(height: 12),

                        Text(
                          "Password ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextFormField(
                          controller: password,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8)
                          ],
                          obscureText: hidePassword,
                          obscuringCharacter: '*',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                          cursorColor: Colors.pink,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            } else if (value.length <8) {
                              return 'Password must be at least 8 characters';
                            }  else if (strPassword != strGetPassword) {
                              return 'Conform Password does not match.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            prefixIcon: Icon(Icons.lock_clock),
                            suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    print(hidePassword);
                                    hidePassword = !hidePassword;
                                    print(hidePassword);
                                  });
                                },
                                child: Icon(Icons.remove_red_eye)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink),
                            ),
                          ),

                        ),

                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.adjust_rounded,
                                    color: Colors.pink,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Remember me ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.end,
                                "Forgot password?",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color:Colors.pink,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 50),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                               login();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            child: Text(
                              "Login ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              "Don’t have an Account ? ",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUp()),
                                );
                              },
                              child: Text(
                                textAlign: TextAlign.start,
                                "Sign up ",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}