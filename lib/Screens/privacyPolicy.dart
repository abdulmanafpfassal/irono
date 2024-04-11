import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:irono/Provider/service_provider.dart';
import 'package:provider/provider.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      await context.read<ServiceProvider>().fetchPrivacyPolicy(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ServiceProvider>(builder: (context, state, _) {
          return state.privacyPolicy.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        state.privacyPolicy['result']['data']['result']
                            .toString(),
                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                      )
                    ],
                  ),
                )
              : SizedBox();
        }),
      ),
    );
  }
}
