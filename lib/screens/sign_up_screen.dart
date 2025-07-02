import 'dart:ui';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/screens/OTP_screen.dart';
import 'package:home_service_app/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Country selectedCountry = Country.parse('US');
  final TextEditingController phoneController = TextEditingController();
  String errorMessage = '';
  void validateInput() {
    String phoneNumber = phoneController.text.trim();
    if (phoneNumber.isEmpty ||
        phoneNumber.length != 10 ||
        !RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
      setState(() {
        errorMessage = 'Please enter a valid 10-digit mobile number.';
      });
    } else {
      setState(() {
        errorMessage = '';
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => otpVerificationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height * 0.32,
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * 0.025),
                      child: Image.asset(
                        'assets/images/LoginImage.png',
                        height: size.height * 0.40,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.04),
                    Text(
                      'Your Home services Expert',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.055,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    Text(
                      'Continue with Phone Number',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: size.width * 0.04,
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(size.width * 0.03),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                onSelect: (Country country) {
                                  setState(() {
                                    selectedCountry = country;
                                  });
                                },
                                countryListTheme: CountryListThemeData(
                                  backgroundColor: Colors.white,
                                  textStyle: TextStyle(
                                    fontSize: size.width * 0.04,
                                    color: Colors.blueGrey,
                                  ),
                                  bottomSheetHeight: size.height * 0.6,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(size.width * 0.05),
                                    topRight: Radius.circular(
                                      size.width * 0.05,
                                    ),
                                  ),
                                  inputDecoration: InputDecoration(
                                    labelText: 'Search',
                                    hintText: 'Start typing to search',
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(
                                          0xFF8C98A8,
                                        ).withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04,
                                vertical: size.height * 0.02,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    selectedCountry.flagEmoji,
                                    style: TextStyle(
                                      fontSize: size.width * 0.05,
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.02),
                                  Text(
                                    '(${selectedCountry.countryCode})',
                                    style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.02),
                                  Text(
                                    '+${selectedCountry.phoneCode}',
                                    style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: size.width * 0.05,
                                    color: Colors.grey[600],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: size.height * 0.03,
                            width: 1,
                            color: Colors.grey[300],
                          ),
                          Expanded(
                            child: TextField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                hintText: 'Enter Mobile Number',
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: size.width * 0.04,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.04,
                                  vertical: size.height * 0.02,
                                ),
                                errorText:
                                    errorMessage.isEmpty ? null : errorMessage,
                              ),
                              keyboardType: TextInputType.phone,
                              style: TextStyle(fontSize: size.width * 0.04),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.065,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              size.height * 0.032,
                            ),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          validateInput();
                        },
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'VIEW OTHER OPTION',
                        style: TextStyle(
                          color: Color(0xFF6B9FFF),
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.035,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ALREADY HAVE AN ACCOUNT? ',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: size.width * 0.035,
                              letterSpacing: 0.3,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                color: Color(0xFF6B9FFF),
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3,
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
