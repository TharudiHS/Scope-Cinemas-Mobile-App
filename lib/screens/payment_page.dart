import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/button.dart';
import 'package:scope_cinemas/screens/confirmation_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController promoController = TextEditingController();

  double payableAmount = 7225.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 15),
          _buildTimer(),
          const SizedBox(height: 10),

          Container(height: 1, color: AppColours.royalIndigo.withOpacity(0.7)),
          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // USER INFO SECTION BOX
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextField("First & surname", nameController),
                          const SizedBox(height: 10),
                          _buildTextField(
                            "Email address",
                            emailController,
                            inputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 10),
                          _buildTextField(
                            "Mobile number",
                            mobileController,
                            inputType: TextInputType.phone,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // HAVE A PROMO CODE BUTTON
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          _showPromoPopup(context);
                        },
                        child: Text(
                          "HAVE A PROMO CODE ?",
                          style: TextStyles.size16SofiaProgoldenYellow,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // CARD DETAILS SECTION BOX
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // logos row
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/mastercard_visa.png',
                                  height: 35,
                                ),
                                const SizedBox(width: 8),
                                Image.asset(
                                  'assets/images/hsbc_offer.png',
                                  height: 35,
                                ),
                                const SizedBox(width: 8),
                                Image.asset(
                                  'assets/images/peoples_bank.png',
                                  height: 35,
                                ),
                                const SizedBox(width: 8),
                                Image.asset(
                                  'assets/images/scope_privilege.png',
                                  height: 35,
                                ),
                                const SizedBox(width: 8),
                                Image.asset(
                                  'assets/images/gift voucher.png',
                                  height: 35,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Title
                          Text(
                            "Enter your Master/Visa Card Details",
                            style: TextStyles.size17SofiaPromidnightBlue,
                          ),
                          const SizedBox(height: 16),

                          // Card Holder Name
                          _buildTextField(
                            "Card Holder Name",
                            cardNameController,
                          ),
                          const SizedBox(height: 10),

                          // Card Number
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: TextFormField(
                              controller: cardNumberController,
                              keyboardType: TextInputType.number,
                              style: TextStyles.size17SofiaProdeepIndigo,
                              decoration: InputDecoration(
                                label: RichText(
                                  text: TextSpan(
                                    text: "Card Number",
                                    style: TextStyles.size17SofiaProdeepIndigo,
                                    children: const [
                                      TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: SvgPicture.asset(
                                    'assets/images/lock-67.svg',
                                    height: 18,
                                  ),
                                ),
                                suffixIconConstraints: const BoxConstraints(
                                  maxHeight: 20,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColours.deepIndigo,
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColours.deepIndigo,
                                    width: 2,
                                  ),
                                ),
                              ),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? "Required"
                                  : null,
                            ),
                          ),

                          // Expiry and Security Code
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField(
                                  "Expiry Date (MM/YY)",
                                  expiryController,
                                  inputType: TextInputType.datetime,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildTextField(
                                  "Security Code",
                                  cvvController,
                                  inputType: TextInputType.number,
                                  obscure: true,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Terms text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text:
                                        'By clicking "Make Payment" you agree to the ',
                                    style:
                                        TextStyles.size14SofiaPromidnightBlue,
                                    children: [
                                      TextSpan(
                                        text: "Terms & Conditions",
                                        style: TextStyles
                                            .size14SofiaProgoldenYellow
                                            .copyWith(
                                              color: AppColours.goldenYellow,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/visa-svgrepo-com.svg',
                                    height: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                    'assets/images/mastercard-12.svg',
                                    height: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                    'assets/images/american-express-svgrepo-com.svg',
                                    height: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Notes
                    Text(
                      "Note:\n\n"
                      "1. Kindly pick up your order from the counter anytime during the show. Please show your SMS to redeem your combo.\n\n"
                      "2. You can cancel the tickets 4 hour(s) before the show. Refunds will be done according to the Cancellation Policy.\n\n"
                      "3. In case of Credit/Debit Card bookings, the Credit/Debit Card and Card holder must be present at the ticket counter while collecting the ticket(s).",
                      style: TextStyles.size12SofiaPro,
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Pay Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 3,
                  width: 148,
                  decoration: BoxDecoration(
                    color: AppColours.goldenYellow,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amount Payable", style: TextStyles.size16SofiaPro),
                    Text(
                      "LKR ${payableAmount.toStringAsFixed(0)}",
                      style: TextStyles.size20SofiaPro,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CustomButton(
                  text: "MAKE A PAYMENT",
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConfirmationPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // PROMO POPUP FUNCTION
  void _showPromoPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "APPLY PROMO CODE",
                      style: TextStyles.size24SofiaProdarkBlue,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.close,
                        color: AppColours.darkBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Text field
                TextFormField(
                  controller: promoController,
                  style: TextStyles.size17SofiaProdeepIndigo,
                  decoration: const InputDecoration(
                    labelText: "Enter Promo Code",
                    hintStyle: TextStyles.size17SofiaProdeepIndigo,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColours.deepIndigo),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColours.deepIndigo,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Apply button
                CustomButton(text: "APPLY", onPressed: () {}),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: AppColours.deepIndigo,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Image.asset(
              "assets/images/arrow_back.png",
              width: 35,
              height: 35,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/images/superman1.jpeg",
                    height: 45,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("SUPERMAN", style: TextStyles.size16SofiaProwhite),
                      const SizedBox(height: 4),
                      Text(
                        "SCOPE CINEMAS - HAVELOCK CITY MALL, FRIDAY, 10 JUNE, 10:30 AM,\nGOLD CLASS 2D : L1, L2, L3",
                        style: TextStyles.size10SofiaProlight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    return Container(
      color: AppColours.darkBlue,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("MAKE YOUR PAYMENT", style: TextStyles.size17SofiaPro),
          Row(
            children: const [
              Icon(Icons.access_time, color: AppColours.goldenYellow, size: 18),
              SizedBox(width: 6),
              Text("05:00", style: TextStyles.size16SofiaProgolden),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
    bool obscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscure,
        style: TextStyles.size17SofiaProdeepIndigo,
        decoration: InputDecoration(
          label: RichText(
            text: TextSpan(
              text: label,
              style: TextStyles.size17SofiaProdeepIndigo,
              children: const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColours.deepIndigo),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColours.deepIndigo, width: 2),
          ),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? "Required" : null,
      ),
    );
  }
}
