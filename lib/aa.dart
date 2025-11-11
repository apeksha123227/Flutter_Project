import 'package:flutter/material.dart';

class aa extends StatefulWidget {
  const aa({super.key});

  @override
  State<aa> createState() => _aaState();
}

class _aaState extends State<aa> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    bool hidePassword = true;


    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            SizedBox(height: 300),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    /*  Divider(
                      color: AppColors.lineColor,
                      thickness: 2,

                    ),*/
                    SizedBox(height: 40),
                    SingleChildScrollView(
                      child: Column(
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
                            cursorColor: AppColors.lineColor,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: "ape@gmail.com",
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              prefixIcon: Icon(Icons.email_outlined),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.lineColor,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 5),
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
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                            cursorColor: AppColors.lineColor,
                            decoration: InputDecoration(
                              hintText: "Password",
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              prefixIcon: Icon(Icons.lock_clock),
                              suffixIcon: Icon(Icons.remove_red_eye_outlined),
                              /*  suffix: GestureDetector(onTap: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });

                              }),*/
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.lineColor,
                                ),
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
                                      color: AppColors.lineColor,
                                    ),
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
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.end,
                                  "Forgot password?",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.lineColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color: AppColors.lineColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "Login ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
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
