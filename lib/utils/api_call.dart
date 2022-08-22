import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class ApiCall {
  fetchCryptoData() async {
    var client = http.Client();
    try {
      var res = await client.get(
          Uri.parse("http://api.coinlayer.com/api/live?access_key=05e7f8205b486dd9e51a0d5548648768"));
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
