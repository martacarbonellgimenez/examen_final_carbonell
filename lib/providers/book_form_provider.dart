import 'package:examen_final_carbonell/models/book_model.dart';
import 'package:flutter/material.dart';

class BookFormProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  BookModel tempBook;

  BookFormProvider(this.tempBook); // Constructor

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}