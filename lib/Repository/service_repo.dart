import 'dart:convert';
import 'dart:developer';

import 'package:irono/Network/webService.dart';
import 'package:irono/Utils/network_urls.dart';

class ServiceRepo {
  ApiService _service = ApiService();

  Future<Map<String, dynamic>> fetchService(var id) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      Map<String, dynamic> body = {"service": id};

      final response = await _service.postResponse(
          NetworkUrls.vendor_service_details, jsonEncode(body), headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }

  Future<Map<String, dynamic>> fetchHomepageData(var body) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.homePageData, jsonEncode(body), headers);
      log("message" + response.body.toString());
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        responseData = responseBody;
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }

  Future<Map<String, dynamic>> fetchPendingServices(var id) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      Map<String, dynamic> body = {"customer": id};

      final response = await _service.postResponse(
          NetworkUrls.pending_service, jsonEncode(body), headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }

  Future<Map<String, dynamic>> fetchNotifications(var body) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.getNotifications, jsonEncode(body), headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }

  Future<Map<String, dynamic>> fetchContactUs(var body) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.contactUs, jsonEncode(body), headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }

  Future<Map<String, dynamic>> termsAndConditions(var body) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.terms, jsonEncode(body), headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }

  Future<Map<String, dynamic>> saveFeedback(var body) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.saveFeedBack, jsonEncode(body), headers);
      log("status is ${response.body}");
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }

  Future<Map<String, dynamic>> privacyPolicy(var body) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.privacyPolicy, jsonEncode(body), headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }

  Future<Map<String, dynamic>> fetchCompletedServices(var id) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      Map<String, dynamic> body = {"customer": id};

      final response = await _service.postResponse(
          NetworkUrls.completed_service, jsonEncode(body), headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }

  Future<Map<String, dynamic>> fetchAcceptedOrders(var body) async {
    log("am here");
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.accepted_services, jsonEncode(body), headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }

  Future<Map<String, dynamic>> confirmBooking(var body) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.book_service, jsonEncode(body), headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }


  Future<Map<String, dynamic>> submitContactUs(var body) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.submitContactUs, jsonEncode(body), headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }


  Future<Map<String, dynamic>> searchServices(var body) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.searchServices, jsonEncode(body), headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }


  Future<Map<String, dynamic>> categoryWiseProviders(var body) async {
    Map<String, dynamic> responseData = {};
    try {
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await _service.postResponse(
          NetworkUrls.categoryWiseProviders, jsonEncode(body), headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        responseData = responseBody;
        log("response data is" + responseBody.toString());
      }
    } catch (e) {
      log("the exception is " + e.toString());
    }
    return responseData;
  }


}
