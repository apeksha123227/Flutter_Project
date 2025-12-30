import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isCardComplete = false;
  bool isLoading = false;

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  /// ⚠️ MOCK PAYMENT (NO BACKEND)
  Future<void> startPayment() async {
    try {
      setState(() => isLoading = true);

      const mockClientSecret =
          "pi_test_secret_dummy_for_learning_only";

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: mockClientSecret,
          merchantDisplayName: "Demo Store",
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      showMessage("Payment flow completed (mock)");
    } on StripeException {
      showMessage("Payment cancelled");
    } catch (_) {
      showMessage("Something went wrong");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 Order Summary
            _sectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Order Summary",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                  _priceRow("Product", "Premium Plan"),
                  SizedBox(height: 6),
                  _priceRow("Amount", "₹499"),
                  Divider(height: 24),
                  _priceRow(
                    "Total",
                    "₹499",
                    isBold: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 Card Details
            _sectionCard(
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

            const SizedBox(height: 30),

            /// 🔹 Pay Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: isCardComplete && !isLoading
                    ? startPayment
                    : null,
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

            const SizedBox(height: 16),

            /// 🔹 Disclaimer
            const Center(
              child: Text(
                "This is a demo payment screen.\nNo real payment is processed.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable card container
  Widget _sectionCard({required Widget child}) {
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
}

/// Price row widget
class _priceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _priceRow(
      this.label,
      this.value, {
        this.isBold = false,
      });

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
      ],
    );
  }
}