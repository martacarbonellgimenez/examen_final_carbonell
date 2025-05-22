import 'dart:convert';

import 'package:examen_final_carbonell/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookProvider extends ChangeNotifier{
  String _baseUrl = "ca3751c7176abebaa347.free.beeceptor.com";

  List<BookModel> books = [];

  BookProvider() { 
    this.getAllBooks();
  }

  getAllBooks() async {
    var url = Uri.https(_baseUrl, "api/books");
    final result = await http.get(url);
    
    final Map<String, dynamic> bookResponse = json.decode(result.body);

    // Guardam cadascun dels objectes a la nostra llista books
    bookResponse.forEach((key, value) {
      final tempBook = BookModel.fromMap(value);
      tempBook.id = key; //CHECK
      books.add(tempBook);
    });

    notifyListeners();

  }
}