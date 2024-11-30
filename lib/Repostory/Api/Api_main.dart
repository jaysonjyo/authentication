import 'dart:convert';


import 'package:authentication_sysytem/Repostory/Modelclass/SignInModelClass.dart';
import 'package:http/http.dart';

import '../Modelclass/SignUpModelClass.dart';
import 'api_client.dart';

class AuthenticationApi {
  ApiClient apiClient = ApiClient();
  Future<SignUpModelClass> getsignup(
      String name,
      String email,
      String state,
      String city,
      String locality,
      String password) async
  {
    String trendingpath =
        'http://45.159.221.50:9890/api/signup';
    var body = {
      "fullName":name,
      "email":email,
      "state":state,
      "city":city,
      "locality":locality,
      "password":password
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return SignUpModelClass.fromJson(jsonDecode(response.body));
  }
  Future<SignInModelClass> getsignin(
      String email,
      String password) async
  {
    String trendingpath =
        'http://45.159.221.50:9890/api/signin';
    var body = {
      "email":email,
      "password":password
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return SignInModelClass.fromJson(jsonDecode(response.body));
  }
}