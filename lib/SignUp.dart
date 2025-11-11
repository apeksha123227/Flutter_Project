import 'package:flutter/material.dart';

import 'SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController conform_password = TextEditingController();
    TextEditingController phonenum = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    TextField(
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
                    TextField(
                      controller: phonenum,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
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
                    TextField(
                      controller: password,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        hintText: "Conform Password",
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        prefixIcon: Icon(Icons.lock_clock),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),

                        /*suffix: GestureDetector(onTap: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });

                              }),*/
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
                    TextField(
                      controller: conform_password,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        hintText: "Conform Password",
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        prefixIcon: Icon(Icons.lock_clock),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),

                        /*suffix: GestureDetector(onTap: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });

                              }),*/
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),
                  ],
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
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
                          MaterialPageRoute(builder: (context) => SignIn()),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
