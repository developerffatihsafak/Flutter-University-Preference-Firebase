import 'dart:convert';


import 'package:flutter_application_1/%C3%BCniversitelerapi/model/book.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  static Future<List<UniversiteApi>> getBooks(String query) async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/fatihcoder1/TR-iller-universiteler-JSON/master/province-universities.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List books = (json.decode(response.body) as List);

      return books.map((e) => new UniversiteApi.fromJson(e)).toList();
    } else {
      
    }
  }
}
