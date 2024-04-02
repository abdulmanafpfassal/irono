import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:irono/Utils/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FocusNode focusNode = FocusNode();


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
                    border: Border.all(color: ColorUtils().primary.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(10.r),

                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter First Name",
                        hintStyle: GoogleFonts.inter(
                            color: Colors.grey
                        )
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorUtils().primary.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(10.r),

                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Last Name",
                        hintStyle: GoogleFonts.inter(
                            color: Colors.grey
                        )
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorUtils().primary.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(10.r),

                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w
                  ),
                  child: TextField(
                    decoration: InputDecoration(

                        border: InputBorder.none,
                        hintText: "Enter Email",
                        hintStyle: GoogleFonts.inter(
                            color: Colors.grey
                        )
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: ColorUtils().primary.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(10.r)),
                  width: MediaQuery.sizeOf(context).width,
                  child: IntlPhoneField(
                    // controller: _controller,
                    initialCountryCode: 'IN',
                    disableLengthCheck: true,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(fontSize: 11.sp,color: Colors.grey),
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    languageCode: "en",
                    onChanged: (phone) {
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
                      borderRadius:
                      BorderRadius.circular(10.r), // <-- Radius
                    )),
                onPressed: () {
                  // if(_controller.text.isNotEmpty){
                  //   state.doLogin(context);                        }

                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => OtpPage()));
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
