import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:irono/Provider/service_provider.dart';
import 'package:irono/Utils/colors.dart';
import 'package:irono/Utils/custom.dart';
import 'package:provider/provider.dart';

class SendFeedBack extends StatefulWidget {
  const SendFeedBack({super.key});

  @override
  State<SendFeedBack> createState() => _SendFeedBackState();
}

class _SendFeedBackState extends State<SendFeedBack> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Send Feedback"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: messageController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: "Enter your feedback here",
                      contentPadding: EdgeInsets.all(10)),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300)),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorUtils().primary)),
                  onPressed: () async {
                    if (messageController.text.isNotEmpty) {
                      await context
                          .read<ServiceProvider>()
                          .submitFeedback(messageController.text, context);
                      messageController.clear();
                    } else {
                      showToast("Feedback cannot be left empty");
                    }
                  },
                  child: Text(
                    "Submit Feedback",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
