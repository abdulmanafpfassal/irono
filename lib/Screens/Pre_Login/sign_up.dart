import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:irono/Provider/authentication_provider.dart';
import 'package:irono/Screens/Pre_Login/otp_page.dart';
import 'package:irono/Utils/colors.dart';
import 'package:irono/Utils/custom.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FocusNode focusNode = FocusNode();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? completeNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: Image.asset(
                "assets/images/logo_irono.png",
                fit: BoxFit.contain,
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorUtils().primary.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter First Name",
                        hintStyle: GoogleFonts.inter(color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorUtils().primary.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Last Name",
                        hintStyle: GoogleFonts.inter(color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorUtils().primary.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Email",
                        hintStyle: GoogleFonts.inter(color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(
                    //     color: ColorUtils().primary.withOpacity(0.4)),
                    // borderRadius: BorderRadius.circular(10.r)
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  child: IntlPhoneField(
                    // controller: _controller,
                    controller: phoneNumberController,
                    initialCountryCode: 'IN',

                    disableLengthCheck: true,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 11.sp, color: Colors.grey),
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                          // borderSide: BorderSide.none,

                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    languageCode: "en",
                    onChanged: (phone) {
                      completeNumber = phone.completeNumber;
                      // state.setPhoneNumber(phone.completeNumber.toString());
                    },
                    onCountryChanged: (country) {},
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorUtils().primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r), // <-- Radius
                    )),
                onPressed: () async {
                  // if(_controller.text.isNotEmpty){
                  //   state.doLogin(context);                        }

                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => OtpPage()));
                  if (firstNameController.text.isEmpty) {
                    showToast("First Name cannot be empty");
                  } else if (lastNameController.text.isEmpty) {
                    showToast("Last Name cannot be empty");
                  } else if (emailController.text.isEmpty) {
                    showToast("Email cannot be empty");
                  } else if (phoneNumberController.text.isEmpty) {
                    showToast("Phone Number cannot be empty");
                  } else {
                    LoadingOverlay.show(context);

                    await context.read<AuthenticationProvider>().signUp(
                        firstNameController.text,
                        lastNameController.text,
                        emailController.text,
                        completeNumber!.split("+")[1],
                        context);
                    LoadingOverlay.hide();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OtpPage(
                              phoneNumber: completeNumber!.split("+")[1],
                            )));
                  }
                },
                child: Text(
                  "Sign In",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
