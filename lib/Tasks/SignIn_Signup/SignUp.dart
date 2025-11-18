import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svg_image/svg_image.dart';

import 'SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conform_password = TextEditingController();
  TextEditingController phonenum = TextEditingController();
  bool hidePassword = true;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String strPassword, strConform_Password;

    strPassword = password.text;
    strConform_Password = conform_password.text;
    void checkPassword() {
      strPassword = password.text;
      strConform_Password = conform_password.text;

      setState(() {
        if (formkey.currentState!.validate()) {
          Navigator.pushNamed(context, '/Password', arguments: strPassword);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Account crated ")));
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Something went wrong ")));
        }
      });
    }

    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: 500,
                child: Image.asset(
                  'assets/images/back.png',
                  width: screenWidth,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 400),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sign Up",
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            } else if (!RegExp(
                              r'^[^@]+@[^@]+\.[^@]+',
                            ).hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 12),

                        Text(
                          "Phone no. ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextFormField(
                          controller: phonenum,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            // FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Mobile number';
                            } else if (value.length < 10) {
                              return 'Please enter valid Mobile number';
                            }
                            return null;
                          },

                          cursorColor: Colors.pink,
                          decoration: InputDecoration(
                            hintText: "9864537564",

                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            prefixIcon: Icon(Icons.send_to_mobile_outlined),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink),
                            ),
                          ),
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
                            LengthLimitingTextInputFormatter(8),
                          ],
                          obscureText: hidePassword,
                          obscuringCharacter: '*',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },

                          cursorColor: Colors.pink,
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
                              child: Icon(Icons.remove_red_eye),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink),
                            ),
                          ),
                        ),

                        SizedBox(height: 12),

                        Text(
                          "Conform Password ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextFormField(
                          controller: conform_password,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8),
                          ],
                          obscureText: hidePassword,
                          obscuringCharacter: '*',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Conform Password';
                            } else if (value.length < 8) {
                              return 'Conform Password must be at least 8 characters';
                            } else if (strPassword != strConform_Password) {
                              return 'Conform Password does not match.';
                            }
                            return null;
                          },

                          cursorColor: Colors.pink,
                          decoration: InputDecoration(
                            hintText: "Conform Password",
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
                              child: Icon(Icons.remove_red_eye),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink),
                            ),
                          ),
                        ),

                        SizedBox(height: 50),

                        SizedBox(
                          width: double.infinity,

                          child: ElevatedButton(
                            onPressed: () {
                              checkPassword();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            child: Text(
                              "Create Account ",
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
                              "Already have an Account ? ",
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
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ),
                                );
                              },
                              child: Text(
                                textAlign: TextAlign.start,
                                "Login ",
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
