import 'dart:convert';

import 'package:examen_final_carbonell/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookProvider extends ChangeNotifier{
  String _baseUrl = "ca3751c7176abebaa347.free.beeceptor.com";

  List<BookModel> books = [];

  late BookModel selectedBook;

  BookProvider() { 
    this.getAllBooks();
  }

  getAllBooks() async {
    var url = Uri.https(_baseUrl, "api/books");
    final result = await http.get(url);

   // final resp = BookModel.bookModelFromMap(result.body);

    notifyListeners();

  }


    // Future<String> createProduct(BookModel product) async {
    // final url = Uri.https(_baseUrl, 'api/books');
    // final resp = await http.post(url, body: product.toJson());
    // final decodedData = jsonDecode(resp.body);
    // print(decodedData['name']);
    // product.id = decodedData['name'];

    // this.books.add(product);
    
    // return product.id!;
  // }
}