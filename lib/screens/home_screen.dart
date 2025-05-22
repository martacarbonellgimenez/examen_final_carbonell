import 'package:examen_final_carbonell/providers/book_provider.dart';
import 'package:examen_final_carbonell/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: 
      productsService.books.length == 0
      ? CircularProgressIndicator()
      : ListView.builder(
        itemCount: productsService.books.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          child: BookCard(book: productsService.books[index]), // AÑADIR!
          onTap: () {
            // productsService.newPicture = null;
 //           productsService.selectedProduct = productsService.products[index].copy();
            Navigator.of(context).pushNamed('book');

          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // productsService.newPicture = null;
          // productsService.selectedProduct = Products(available: true, name: "", price: 0);
          Navigator.of(context).pushNamed('book');
        },
      ),
    );
  }
}
