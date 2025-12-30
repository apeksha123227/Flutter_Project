import 'package:flutter/material.dart';
import 'package:flutter_practice/Common%20Functions/Common_Functions.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool isCardComplete = false;
  bool isLoading = false;

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> startPayment() async {
    try {
      setState(() => isLoading = true);
      const mockClientSecre = "pi_test_secret_dummy_for_learning_only";

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: mockClientSecre,
          merchantDisplayName: "Demo Store",
        ),
      );
      await Stripe.instance.presentPaymentSheet();
      showMessage("Payment flow completed (mock)");
    } on StripeException {
      showMessage("Payment cancelled");
    } catch (e) {
      showMessage("Something went wrong");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "Payment"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionCard(
                child: Column(
                  children: [
                    Text(
                      "Order Summary",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    RowOfPrice("Product", "Premium Plan"),
                    SizedBox(height: 6),
                    RowOfPrice("Product", "Premium Plan"),
                    Divider(height: 24),
                    RowOfPrice("Total", "₹600", isBold: true),
                  ],
                ),
              ),
              SizedBox(height: 20),
              sectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Card Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),

                    CardField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Card number",
                      ),
                      onCardChanged: (card) {
                        setState(() {
                          isCardComplete = card?.complete ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: isCardComplete && !isLoading ? startPayment : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                      : const Text(
                    "Pay ₹499",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              Center(
                child: Text(
                  "This is a demo payment screen.\nNo real payment is processed.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget sectionCard({required Widget child}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: child,
  );
}

class RowOfPrice extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const RowOfPrice(this.label, this.value, {this.isBold = false});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 14,
      fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: style),
        // Text(value, style: style),
      ],
    );
  }
}
