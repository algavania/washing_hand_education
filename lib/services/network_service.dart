import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  static String baseUrl = 'https://handwash-lxz6xwlfka-et.a.run.app/v1';
  static Map<String, String> headers = {
    "Accept": "application/json",
    'Content-Type': 'application/json'
  };

  static Future<http.Response> get(String endpoint) async {
    final res = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers
    );
    return res;
  }

  static Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final res = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers,
        body: jsonEncode(body)
    );
    return res;
  }

  static Future<http.Response> put(String endpoint, Map<String, dynamic> body) async {
    debugPrint('endpoint $baseUrl$endpoint');
    final res = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers,
        body: jsonEncode(body)
    );
    debugPrint('update handwash state ${res.body}');
    return res;
  }
}