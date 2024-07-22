import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shimmer/shimmer.dart';
import '../screens/HomeScreen.dart';
import '../utils/constants.dart';

class EnterCodePass extends StatefulWidget {
  @override
  _EnterCodePassState createState() => _EnterCodePassState();
}

class _EnterCodePassState extends State<EnterCodePass> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = Constants.screenWidth(context);
    double screenHeight = Constants.screenHeight(context);

    return Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: screenHeight * 0.03),
              Shimmer.fromColors(
                baseColor: Colors.black,
                highlightColor: Colors.white,
                child: Text(
                  'Password Recovery',
                  style: Constants.poppins(
                    fontSize: screenHeight * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Enter 4-digits password we sent you on your phone number',
                style: Constants.poppins(
                  fontSize: screenHeight * 0.020,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              Shimmer.fromColors(
                baseColor: Colors.black,
                highlightColor: Colors.white,
                child: Text(
                  '+98******00',
                  textAlign: TextAlign.center,
                  style: Constants.poppins(
                    fontSize: screenHeight * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                width: screenWidth * 0.8,
                child: PinCodeTextField(
                  controller: textEditingController,
                  cursorColor: Constants.mainAppColor,
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 4,
                  onChanged: (value) {
                    // Handle code change
                    setState(() {});
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: screenHeight * 0.07,
                    fieldWidth: screenWidth * 0.15,
                    activeFillColor: Constants.mainAppColor,
                    selectedFillColor: Constants.mainAppColor,
                    inactiveFillColor: Colors.black,
                    activeColor: textEditingController.text.isEmpty
                        ? Constants.mainAppColor
                        : Colors.black,
                    selectedColor: textEditingController.text.isEmpty
                        ? Constants.mainAppColor
                        : Colors.black,
                    inactiveColor: Colors.black,
                  ),
                  animationType: AnimationType.none,
                  onCompleted: (value) {
                    // Handle the completion of the input
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                      // Handle Save action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.buttonColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.25,
                        vertical: screenHeight * 0.015,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Confirm',
                      style: Constants.poppins(
                        fontSize: screenHeight * 0.025,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Constants.screenHeightFraction(context, 0.01),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
