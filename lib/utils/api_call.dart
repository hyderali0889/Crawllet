import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class ApiCall {
  fetchCryptoData() async {
    var client = http.Client();
    try {
      var res = await client.get(
          Uri.parse("https://rest.coinapi.io/v1/assets?apikey=F05194A9-8713-47A8-ABB9-49E29EE85F2A"));
      if (res.statusCode == 200) {
        return json.decode(res.body);
      } else if (res.statusCode == 502) {
        return const Text("Not Connected");
      }
    } catch (e) {
      return false;
    }
  }
}
