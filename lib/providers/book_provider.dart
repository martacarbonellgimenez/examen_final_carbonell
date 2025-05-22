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
    
    final bookResponse = BookModel.fromJson(result.body);
    // CHECK CÓMO GUARDARLO
    //books = bookResponse.;

    notifyListeners();

  }
}