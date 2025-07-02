import 'dart:ui';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/widgets/wavePainter.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Country selectedCountry = Country.parse('US'); // Default to USA

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 280, 
                  width: double.infinity,
                  child: CustomPaint(painter: WavePainter()),
                ),
          
                SizedBox(
                  height: 280,
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Image.asset(
                        'assets/images/LoginImage.png',
                        height: 240, // Adjusted size
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: 32), 
                    Text(
                      'Your Home services Expert',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22, 
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Continue with Phone Number',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16, 
                      ),
                    ),
                    SizedBox(height: 32), 
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50], // Light background
                        borderRadius: BorderRadius.circular(12),
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
                                  flagSize: 25,
                                  backgroundColor: Colors.white,
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey,
                                  ),
                                  bottomSheetHeight: 500,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
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
                                horizontal: 16,
                                vertical: 16,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    selectedCountry.flagEmoji,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '(${selectedCountry.countryCode})',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '+${selectedCountry.phoneCode}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20,
                                    color: Colors.grey[600],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Divider
                          Container(
                            height: 24,
                            width: 1,
                            color: Colors.grey[300],
                          ),

                          // Phone number input
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Mobile Number',
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 52, 
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'VIEW OTHER OPTION',
                        style: TextStyle(
                          color: Color(0xFF6B9FFF), 
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),

                    Spacer(), 
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ALREADY HAVE AN ACCOUNT? ',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                              letterSpacing: 0.3,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                color: Color(
                                  0xFF6B9FFF,
                                ), 
                                fontSize: 14,
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
