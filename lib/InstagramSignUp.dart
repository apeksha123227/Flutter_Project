import 'package:flutter/material.dart';


class InstagramSignUp extends StatelessWidget {
  const InstagramSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "Instagram Sign Up UI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
              backgroundColor: Colors.pink,
              leading: Icon(Icons.arrow_back, size: 20, color: Colors.white),
              elevation: 5,
            ),

            /*body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16)
                child: Colum(
                children: [
            Text(
            'Instagram',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
                ],*/
        )
    );
  }
}
