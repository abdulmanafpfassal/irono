import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:irono/Provider/service_provider.dart';
import 'package:provider/provider.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      await context.read<ServiceProvider>().fetchTermsAndConditions(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Terms and conditions"),
      ),
      body: Consumer<ServiceProvider>(builder: (context, state, _) {
        return state.terms.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        state.terms['result']['data']['result'].toString(),
                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                      )
                    ],
                  ),
                ),
              )
            : SizedBox();
      }),
    );
  }
}
