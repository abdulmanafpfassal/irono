import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irono/Provider/service_provider.dart';
import 'package:irono/Screens/service/service_details.dart';
import 'package:provider/provider.dart';

class CategoryWiseProviders extends StatefulWidget {
  const CategoryWiseProviders({super.key});

  @override
  State<CategoryWiseProviders> createState() => _CategoryWiseProvidersState();
}

class _CategoryWiseProvidersState extends State<CategoryWiseProviders> {
 Widget serviceCard(
      {required String image,
      required String service,
      required String price,
      required var id}) {
    return InkWell(
      onTap: () {
        context.read<ServiceProvider>().setSelectedId(id);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ServiceDetailsPage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.all(10),
          height: 110.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              Container(
                width: 130.w,
                height: 130.h,
                child: FutureBuilder<String?>(
                  future: context.read<ServiceProvider>().getSessionCookie(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Return a placeholder or loading indicator while waiting for the session cookie
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // Handle error case
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Retrieve the session cookie from the snapshot data
                      String? sessionCookie = snapshot.data;
                      // log("session cookier is " + sessionCookie!);
                      // If sessionCookie is null, handle this case according to your app logic
        
                      // Pass sessionCookie as a header to Image.network
                      return Image.network(
                        image,
                        fit: BoxFit.cover,
                        headers: {
                          "X-Openerp-Session-id": sessionCookie ?? '',
                        },
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      service.toString(),
                      style: GoogleFonts.inter(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<ServiceProvider>(builder: (context, state, _) {
                return state.categoryWiseProviders.isNotEmpty
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(
                            state
                                .categoryWiseProviders["result"]['data']
                                    ["result"]
                                .length,
                            (index) => serviceCard(
                                image: state.categoryWiseProviders['result']['data']
                                    ["result"][index]['image'].toString(),
                                service: state.categoryWiseProviders['result']['data']
                                    ["result"][index]['name'].toString(),
                                price: "130",
                                id: state.categoryWiseProviders['result']['data']
                                    ['result'][index]['id']),
                          ),
                        ),
                      )
                    : SizedBox();
              })
            ],
          ),
        ),
      ),
    );
  }
}
