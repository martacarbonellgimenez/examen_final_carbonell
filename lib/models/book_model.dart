import 'dart:convert';

class BookModel {
    String id;
    String nom;
    String descripcio;
    String? foto;
    String any;
    String autor;

    BookModel({
        required this.id,
        required this.nom,
        required this.descripcio,
        this.foto,
        required this.any,
        required this.autor,
    });

    factory BookModel.fromJson(String str) => BookModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

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
