import 'dart:convert';

List<BookModel> bookModelFromMap(String str) => List<BookModel>.from(json.decode(str).map((x) => BookModel.fromMap(x)));

String bookModelToMap(List<BookModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class BookModel {
    String id;
    String nom;
    String descripcio;
    String foto;
    String any;
    String autor;

    BookModel({
        required this.id,
        required this.nom,
        required this.descripcio,
        required this.foto,
        required this.any,
        required this.autor,
    });

    factory BookModel.fromMap(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        nom: json["nom"],
        descripcio: json["descripcio"],
        foto: json["foto"],
        any: json["any"],
        autor: json["autor"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "descripcio": descripcio,
        "foto": foto,
        "any": any,
        "autor": autor,
    };
}