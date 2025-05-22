import 'package:examen_final_carbonell/providers/book_form_provider.dart';
import 'package:examen_final_carbonell/providers/book_provider.dart';
import 'package:examen_final_carbonell/widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BookProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => BookFormProvider(booksProvider.selectedBook),
      child: _bookScreenBody(bookService: booksProvider),
    );
  }
}

class _bookScreenBody extends StatelessWidget {
  const _bookScreenBody({super.key, required this.bookService});

  final BookProvider bookService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<BookFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BookImage(url: bookService.selectedBook.foto),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () async {
                      //TODO: Implementar funcionalitat de cercar imatge de la galeria
                      final ImagePicker picker = ImagePicker();
                      // Pick an image.
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      // Capture a photo.
                      final XFile? photo = await picker.pickImage(
                        source: ImageSource.camera,
                      );
                    },
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            _ProductForm(),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed:(
          bookService.saveOrCreateProduct(productForm.tempProduct);
        ),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final tempProduct = productForm.tempProduct;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 10),
              TextFormField(
                initialValue: tempProduct.name,
                onChanged: (value) => tempProduct.name = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El nom és obligatori';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nom del producte',
                  labelText: 'Nom:',
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: tempProduct.price.toString(),
                onChanged: (value) {
                  if (double.tryParse(value) == null) {
                    tempProduct.price = 0;
                  } else {
                    tempProduct.price = double.parse(value);
                  }
                },
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El preu és obligatori';
                  }
                },
              ),
              SizedBox(height: 30),
              SwitchListTile.adaptive(
                value: tempProduct.available,
                title: Text('Disponible'),
                activeColor: Colors.indigo,
                onChanged: (value) => productForm.updateAvailability(value),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(25),
      bottomLeft: Radius.circular(25),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0, 5),
        blurRadius: 5,
      ),
    ],
  );
}
