import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:irono/Provider/authentication_provider.dart';
import 'package:irono/Utils/colors.dart';
import 'package:irono/Utils/custom.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      await context.read<AuthenticationProvider>().fetchProfileDetails();
      var profileData = context.read<AuthenticationProvider>().profileDetails;
      log("profile data is $profileData");
      nameController.text = profileData['result']['data']['name'].toString();
      emailController.text = profileData['result']['data']['email'].toString();
      phoneController.text = profileData['result']['data']['phone'].toString();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter your Name",
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: "Enter your Phone Number",
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorUtils().primary)),
                  onPressed: () async {
                    LoadingOverlay.show(context);
                    await context.read<AuthenticationProvider>().updateProfile(
                        context,
                        nameController.text,
                        emailController.text,
                        phoneController.text);
                    LoadingOverlay.hide();
                  },
                  child: Text(
                    "Update Profile",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
