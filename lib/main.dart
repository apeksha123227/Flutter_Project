import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import 'Tasks/SignIn_Signup/DisplayScren.dart';
import 'HomeScreen.dart';
import 'Tasks/SignIn_Signup/SignIn.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Stripe.publishableKey = "pk_test_XXXXXXXXXXXXXXXX";
  Stripe.publishableKey = "pk_test_xxxxxxxxxxxxx";
  //  Stripe.merchantIdentifier = 'merchant.flutter.stripe';
  await Stripe.instance.applySettings();
  runApp(const Myapp_31_Oct_Task());
}

class Myapp_31_Oct_Task extends StatelessWidget {
  const Myapp_31_Oct_Task({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/display': (context) => Displayscren(),
        '/Password': (context) => SignIn(),
      },
    );
  }
}
