import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/screens/OTP_screen.dart';
import 'package:home_service_app/screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Country selectedCountry = Country(
    phoneCode: "1",
    countryCode: "US",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "United States",
    example: "United States",
    displayName: "United States",
    displayNameNoCountryCode: "US",
    e164Key: "",
  );
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
    final isSmall = size.height < 700;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.025),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, size: size.width * 0.07),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.07,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: size.height * 0.08),
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.065,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6A7FDB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          size.height * 0.032,
                        ),
                      ),
                      elevation: 0,
                    ),
                    icon: Icon(
                      Icons.facebook,
                      color: Colors.white,
                      size: size.width * 0.06,
                    ),
                    label: Text(
                      'CONTINUE WITH FACEBOOK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.065,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          size.height * 0.032,
                        ),
                      ),
                      side: BorderSide(color: Colors.grey.shade300, width: 1),
                      backgroundColor: Colors.white,
                    ),
                    icon: Container(
                      width: size.width * 0.05,
                      height: size.width * 0.05,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://developers.google.com/identity/images/g-logo.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    label: Text(
                      'CONTINUE WITH GOOGLE',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Text(
                  'OR CONTINUE WITH PHONE NUMBER',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
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
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.height * 0.015,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(
                              size.width * 0.02,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                selectedCountry.flagEmoji,
                                style: TextStyle(fontSize: size.width * 0.05),
                              ),
                              SizedBox(width: size.width * 0.02),
                              Text(
                                selectedCountry.countryCode,
                                style: TextStyle(fontSize: size.width * 0.03),
                              ),
                              SizedBox(width: size.width * 0.01),
                              Text('+${selectedCountry.phoneCode}'),
                              Icon(
                                Icons.arrow_drop_down,
                                size: size.width * 0.05,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            hintText: 'Enter Mobile Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                size.width * 0.02,
                              ),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                size.width * 0.02,
                              ),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                size.width * 0.02,
                              ),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.015,
                            ),
                            errorText:
                                errorMessage.isEmpty ? null : errorMessage,
                          ),

                          keyboardType: TextInputType.number,
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
                      'LOG IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                ),
                SizedBox(
                  height: isSmall ? size.height * 0.03 : size.height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DON\'T HAVE AN ACCOUNT? ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: size.width * 0.035,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: isSmall ? size.height * 0.03 : size.height * 0.06,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
