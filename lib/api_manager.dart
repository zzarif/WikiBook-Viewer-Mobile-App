import 'dart:convert';
import 'package:http/http.dart' as http;
import 'book.dart';

class ApiManager {
  static Future<List<Book>> getBookList() async {
    String url = "https://mocki.io/v1/4ae80738-70ac-40f6-b911-c4d9e3c452df";
    final response = await http.get(Uri.parse(url));
    List<Book> books = [];
    for(var singleData in json.decode(response.body) as List){
      books.add(Book.fromJson(singleData));
    }
    return books;
  }
}