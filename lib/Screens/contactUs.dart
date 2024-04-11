import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:irono/Provider/service_provider.dart';
import 'package:irono/Utils/colors.dart';
import 'package:irono/Utils/custom.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  String _selectedPriority = 'Low';
  int priority = 0;
    TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      await context.read<ServiceProvider>().fetchContactUs(context);
    });
  }

  launchDialer(number) async {
    var phoneNumber = 'tel:' + number; // Replace with your phone number
    launchUrl(Uri.parse(phoneNumber));
  }

  launchEmail(mailId) async {
    var emailAddress = 'mailto:$mailId'; // Replace with your email address
    launchUrl(Uri.parse(emailAddress));
  }

  launchWebsite(website) async {
    var websiteUrl = website; // Replace with your email address
    launchUrl(Uri.parse(websiteUrl));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      // body: Consumer<ServiceProvider>(builder: (context, state, _) {
      //   return state.contactUs.isNotEmpty
      //       ? Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: SingleChildScrollView(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Image.network(
      //                     "https://unblast.com/wp-content/uploads/2020/09/Contact-Us-Vector-Illustration-Part-02.jpg"),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 Center(
      //                   child: Text(
      //                     state.contactUs['result']['data']['result']['name']
      //                         .toString(),
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.w500, fontSize: 20.sp),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     InkWell(
      //                       onTap: () {
      //                         launchDialer(state.contactUs['result']['data']
      //                             ['result']['phone']);
      //                       },
      //                       child: Container(
      //                         width: 100,
      //                         decoration: BoxDecoration(
      //                             boxShadow: [
      //                               BoxShadow(
      //                                 color: Colors.grey.withOpacity(0.5),
      //                                 spreadRadius: 5,
      //                                 blurRadius: 7,
      //                                 offset: Offset(
      //                                     0, 3), // changes position of shadow
      //                               ),
      //                             ],
      //                             borderRadius: BorderRadius.circular(10),
      //                             color: Colors.white),
      //                         child: Center(
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(10.0),
      //                             child: Column(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               children: [
      //                                 CircleAvatar(
      //                                   child: Icon(
      //                                     Icons.call,
      //                                     color: Colors.orange,
      //                                   ),
      //                                   backgroundColor:
      //                                       Colors.orange.withOpacity(.2),
      //                                 ),
      //                                 SizedBox(
      //                                   height: 10,
      //                                 ),
      //                                 Text("Call Us")
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     InkWell(
      //                       onTap: () {
      //                         launchEmail(state.contactUs['result']['data']
      //                             ['result']['email']);
      //                       },
      //                       child: Container(
      //                         width: 100,
      //                         decoration: BoxDecoration(
      //                             boxShadow: [
      //                               BoxShadow(
      //                                 color: Colors.grey.withOpacity(0.5),
      //                                 spreadRadius: 5,
      //                                 blurRadius: 7,
      //                                 offset: Offset(
      //                                     0, 3), // changes position of shadow
      //                               ),
      //                             ],
      //                             borderRadius: BorderRadius.circular(10),
      //                             color: Colors.white),
      //                         child: Center(
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(10.0),
      //                             child: Column(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               children: [
      //                                 CircleAvatar(
      //                                   child: Icon(
      //                                     Icons.mail,
      //                                     color: Colors.red,
      //                                   ),
      //                                   backgroundColor:
      //                                       Colors.red.withOpacity(.2),
      //                                 ),
      //                                 SizedBox(
      //                                   height: 10,
      //                                 ),
      //                                 Text("Email Us")
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     InkWell(
      //                       onTap: () {
      //                         launchWebsite(state.contactUs['result']['data']
      //                             ['result']['website']);
      //                       },
      //                       child: Container(
      //                         width: 100,
      //                         decoration: BoxDecoration(
      //                             boxShadow: [
      //                               BoxShadow(
      //                                 color: Colors.grey.withOpacity(0.5),
      //                                 spreadRadius: 5,
      //                                 blurRadius: 7,
      //                                 offset: Offset(
      //                                     0, 3), // changes position of shadow
      //                               ),
      //                             ],
      //                             borderRadius: BorderRadius.circular(10),
      //                             color: Colors.white),
      //                         child: Center(
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(10.0),
      //                             child: Column(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               children: [
      //                                 CircleAvatar(
      //                                   child: Icon(
      //                                     Icons.web_rounded,
      //                                     color: Colors.blue,
      //                                   ),
      //                                   backgroundColor:
      //                                       Colors.blue.withOpacity(.2),
      //                                 ),
      //                                 SizedBox(
      //                                   height: 10,
      //                                 ),
      //                                 Text("Website")
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Text(
      //                     "Address : ${state.contactUs['result']['data']['result']['street']}, ${state.contactUs['result']['data']['result']['city']}, ${state.contactUs['result']['data']['result']['state']}, ${state.contactUs['result']['data']['result']['country']},  ${state.contactUs['result']['data']['result']['zip']}",
      //                     style: TextStyle(fontSize: 15.sp),
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: 8),
      //                   child: Text(
      //                     "Phone : ${state.contactUs['result']['data']['result']['phone']}",
      //                     style: TextStyle(fontSize: 15.sp),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: 8),
      //                   child: Text(
      //                     "Email : ${state.contactUs['result']['data']['result']['email']}",
      //                     style: TextStyle(fontSize: 15.sp),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: 8),
      //                   child: Text(
      //                     "Website : ${state.contactUs['result']['data']['result']['website']}",
      //                     style: TextStyle(fontSize: 15.sp),
      //                   ),
      //                 ),
      //                ],
      //             ),
      //           ),
      //         )
      //       : SizedBox();
      // }),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Contact Us by filling up the form",
                style: TextStyle(fontSize: 13.sp),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: TextField(
                    controller: subjectController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: InputBorder.none,
                        hintText: "Subject"),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: InputBorder.none,
                        hintText: "Description"),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedPriority,
                    isExpanded: true,
                    onChanged: (value) {
                      _selectedPriority = value!;
                      if (value == 'Low') {
                        priority = 0;
                      } else if (value == 'Medium') {
                        priority = 1;
                      } else if (value == 'High') {
                        priority = 2;
                      } else {
                        priority = 3;
                      }
                      setState(() {});
                    },
                    items: <String>['Low', 'Medium', 'High', 'Very High']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            value,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorUtils().primary)),
                  onPressed: () async {
                    if (subjectController.text.isEmpty) {
                      showToast("Subject cannot be empty");
                    } else if (descriptionController.text.isEmpty) {
                      showToast("Description cannot be empty");
                    } else {
                      await context.read<ServiceProvider>().saveContactUs(
                          context,
                          subjectController.text,
                          descriptionController.text,
                          priority);
                      subjectController.clear();
                      descriptionController.clear();
                      priority = 0;
                      _selectedPriority = 'Low';
                      setState(() {});
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
