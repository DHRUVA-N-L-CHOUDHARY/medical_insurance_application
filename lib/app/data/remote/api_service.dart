import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical_insurance_system/app/data/remote/api_interface.dart';
import 'endpoints.dart';

class ApiService extends ApiInterface {
  @override
  Future deleteApi(
      {String? url, Map<String, String>? headers, Map? data}) async {
    var client = http.Client();
    dynamic responseJson;
    final response = await client.delete(Uri.parse(url!),
        headers: <String, String>{
          'accept': 'application/json',
          'content-type': 'application/json',
          
        },
        body: jsonEncode(data));
    responseJson = jsonDecode(response.body);
    return responseJson;
  }

  @override
  Future getApi({
    String? url,
    Map<String, String>? headers,
  }) async {
    var client = http.Client();
    final response =
        await client.get(Uri.parse(url!), headers: <String, String>{
      'accept': 'application/json',
      'content-type': 'application/json',
      // 'authorization': ApiInterface.auth!
    });
    return response;
  }

  @override
  Future postApi({String? url, Map<String, String>? headers, Map? data}) async {
    var client = http.Client();
    print(data);
    // if (MySharedPref.getToken() != null) {
    //   data = data ?? {};
    //   data['token'] = MySharedPref.getToken();
    //   data['user_id'] = MySharedPref.getUserId();
    // }
    http.Response res = await client.post(Uri.parse(url!),
        headers: headers ??
            <String, String>{
              'content-type': 'application/json',
              
            },
        body: jsonEncode(data));

    return res;
  }

  @override
  Future putApi({String? url, Map<String, String>? headers, Map? data}) async {
    var client = http.Client();
    dynamic responseJson;
    final response = await client.put(Uri.parse(url!),
        headers: headers ??
            <String, String>{
              'accept': 'application/json',
              'content-type': 'application/json',
              
            },
        body: jsonEncode(data));
    responseJson = jsonDecode(response.body);
    return responseJson;
  }

  Map<String, dynamic>? _parseBaseResponse(http.Response res) {
    debugPrint(jsonEncode(res.body));
    Map<String, dynamic> response = jsonDecode(res.body);
    if (response.containsKey("error")) {
      try {
        List entryList = response['error'].entries.toList();
        List<dynamic> errorList = [];
        entryList.forEach((element) {
          errorList.add(element.value.first);
        });
        // DialogHelper.showErrorDialog("Error", errorList.join("\n"));
      } catch (e) {
        // DialogHelper.showErrorDialog("Error", response['error']);
      }
      return null;
    } else {
      return response;
    }
  }

  Future<Map> createUserAccount(Map<String, dynamic> data, String usertype) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.register + usertype, data: data);
    return _parseBaseResponse(res) ?? {};
  }

  Future<Map> loginUser(Map<String, dynamic> data,  String usertype) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.login + usertype, data: data);
    return _parseBaseResponse(res) ?? {};
  }

}
