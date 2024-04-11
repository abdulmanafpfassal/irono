import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:irono/Provider/authentication_provider.dart';
import 'package:irono/Repository/service_repo.dart';
import 'package:irono/Utils/custom.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceProvider with ChangeNotifier {
  int selectedId = -1;
  ServiceRepo serviceRepo = ServiceRepo();
  Map<String, dynamic> serviceDetails = {};
  List<Map<String, dynamic>> services = [{}];
  var price;
  DateTime? selectedDateTime;
  bool selectedServices = false;
  Map<String, dynamic> pendingServices = {};
  Map<String, dynamic> acceptedOrders = {};
  Map<String, dynamic> notifications = {};
  Map<String, dynamic> terms = {};
  Map<String, dynamic> privacyPolicy = {};
  Map<String, dynamic> contactUs = {};
  Map<String, dynamic> searchResults = {};
  Map<String, dynamic> categoryWiseProviders = {};

  bool checkIfServicesAreSelected() {
    for (int i = 0; i < services.length; i++) {
      if (services[i]['count'] != "0") {
        selectedServices = true;
        return true; // Exit and return true since we found a count that is not zero
      }
    }
    return false; // Return false if no service has count other than zero
  }

  fetchAcceptedorders(BuildContext context) async {
    var userId = context.read<AuthenticationProvider>().userId;
    var body = {"customer": userId};
    log("clicked here $body");
    acceptedOrders = await serviceRepo.fetchAcceptedOrders(body);
    notifyListeners();
  }

  fetchHomePageDatas(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var phoneNumber = await sharedPreferences.getString("phone_number");
    var body = {"phone": phoneNumber};
    final response = await serviceRepo.fetchHomepageData(body);
    var userId = response['result']['data']['user_id'];
    context.read<AuthenticationProvider>().setUserId(userId);
    context.read<AuthenticationProvider>().setLoginResponse(response);
  }

  saveContactUs(BuildContext context, subject, description, priority) async {
    LoadingOverlay.show(context);
    var userId = context.read<AuthenticationProvider>().userId;
    var body = {
      "user": userId,
      "subject": subject,
      "description": description,
      "priority": priority
    };
    await serviceRepo.submitContactUs(body);
    LoadingOverlay.hide();
    showToast("Submitted your data successfully");
  }

  search(BuildContext context, search) async {
    var userId = context.read<AuthenticationProvider>().userId;
    var body = {"user": userId, "search": search};
    searchResults = await serviceRepo.searchServices(body);
    notifyListeners();
  }

  categoryBasedProviders(BuildContext context, categoryId) async {
    var userId = context.read<AuthenticationProvider>().userId;
    var body = {"category_id": categoryId, "user": userId};
    categoryWiseProviders = await serviceRepo.categoryWiseProviders(body);
    notifyListeners();
  }

  setSelectedDateTime(DateTime dateTime) {
    this.selectedDateTime = dateTime;
  }

  setSelectedId(id) {
    this.selectedId = id;
    notifyListeners();
  }

  String formattedDateTime(DateTime dateTime) {
    return DateFormat("MMMM d, HH:mm").format(dateTime);
  }

  fetchPendingServices(BuildContext context) async {
    var loginResponse = context.read<AuthenticationProvider>().loginResponse;
    pendingServices = await serviceRepo
        .fetchPendingServices(loginResponse["result"]["data"]["user_id"]);
    notifyListeners();
  }

  fetchCompletedServices(BuildContext context) async {
    var loginResponse = context.read<AuthenticationProvider>().loginResponse;
    pendingServices = await serviceRepo
        .fetchCompletedServices(loginResponse["result"]["data"]["user_id"]);
    notifyListeners();
  }

  fetchServiceDetails() async {
    serviceDetails.clear();
    price = null;
    notifyListeners();
    selectedDateTime = null;
    selectedServices = false;
    serviceDetails = await serviceRepo.fetchService(this.selectedId);
    services.clear();
    for (int i = 0;
        i < serviceDetails['result']['data']['services'].length;
        i++) {
      services.add({
        "id": serviceDetails['result']["data"]["services"][i]["id"],
        "name":
            serviceDetails['result']['data']['services'][i]['name'].toString(),
        "count": "0",
        "price": serviceDetails['result']['data']['services'][i]['lst_price']
      });
    }
    notifyListeners();
  }

  fetchNotifications(BuildContext context) async {
    var userId = context.read<AuthenticationProvider>().userId;
    var body = {"user": userId};
    log("clicked here $body");
    notifications = await serviceRepo.fetchNotifications(body);
    notifyListeners();
  }

  fetchContactUs(BuildContext context) async {
    var userId = context.read<AuthenticationProvider>().userId;
    var body = {"user": userId};
    log("clicked here $body");
    contactUs = await serviceRepo.fetchContactUs(body);
    notifyListeners();
  }

  fetchTermsAndConditions(BuildContext context) async {
    var userId = context.read<AuthenticationProvider>().userId;
    var body = {"user": userId};
    terms = await serviceRepo.termsAndConditions(body);
    notifyListeners();
  }

  fetchPrivacyPolicy(BuildContext context) async {
    var userId = context.read<AuthenticationProvider>().userId;
    var body = {"user": userId};
    privacyPolicy = await serviceRepo.privacyPolicy(body);
    notifyListeners();
  }

  updateCount(index, int count) async {
    price = 0; // Reset price to zero before calculating the total sum
    services[index]['count'] = count.toString();

    for (int i = 0; i < services.length; i++) {
      if (int.parse(services[i]['count']) > 0) {
        price += int.parse(services[i]['count']) *
            double.parse(services[i]['price'].toString());
      }
    }

    print(
        "price is $price"); // Assuming log() is replaced with print() for demonstration purposes
    notifyListeners();
  }

  Future<String?> getSessionCookie() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.getString("session");
  }

  confirmBooking(BuildContext context, notes) async {
    if (checkIfServicesAreSelected() == false) {
      showToast("Please select the services you wish to book");
    } else if (selectedDateTime == null) {
      showToast("Please choose your appropriate timing for booking");
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Booking'),
            content: Text('Are you sure you want to continue with booking ?'),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  var requestBody = {};
                  var selectedServices = [];
                  var loginResponse =
                      context.read<AuthenticationProvider>().loginResponse;
                  log("loginresponse is ${loginResponse["result"]["data"]["user_id"]}");
                  for (int i = 0; i < services.length; i++) {
                    if (services[i]["count"] != "0") {
                      selectedServices.add({
                        "id": services[i]["id"],
                        "qty": services[i]["count"]
                      });
                    }
                  }
                  // log("selected services are $selectedServices and vendor is $selectedId and deilvery date is ${DateFormat('MM/dd/yy HH:mm:ss').format(selectedDateTime!)}");

                  requestBody = {
                    "customer": loginResponse["result"]["data"]["user_id"],
                    "vendor": selectedId,
                    "services": selectedServices,
                    "notes": notes,
                    "delivery_date": DateFormat('MM/dd/yy HH:mm:ss')
                        .format(selectedDateTime!)
                  };
                  LoadingOverlay.show(context);
                  ServiceRepo serviceRepo = ServiceRepo();
                  await serviceRepo.confirmBooking(requestBody);
                  LoadingOverlay.hide();
                  showToast("Booking completed successfully");
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                  // Perform actions when 'No' is pressed
                  print('User cancelled');
                },
                child: Text('No'),
              ),
            ],
          );
        },
      );
    }
  }

  submitFeedback(feedBack, BuildContext context) async {
    LoadingOverlay.show(context);
    var userId = context.read<AuthenticationProvider>().userId;
    var body = {"user": userId, "message": feedBack};
    await serviceRepo.saveFeedback(body);
    LoadingOverlay.hide();
    showToast("Feedback submitted successfully");
  }
}
