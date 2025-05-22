import 'dart:io';

import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {

  final String?  url;

  const BookImage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 450,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          child: getImage(url!),
      ),
    ));
  }

  Widget getImage(String picture) {
    if(picture == null) {
      return Image(
              image: AssetImage('assets/no-image.jpg'), // NO HAY CARPETA DE ASSESTS AQUI
              fit: BoxFit.cover);
    }
    if(picture.startsWith('http')){
    return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(url!),
              fit: BoxFit.cover);
    } else {
      return Image.file(File(picture), fit: BoxFit.cover);
    }
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ]);
}
