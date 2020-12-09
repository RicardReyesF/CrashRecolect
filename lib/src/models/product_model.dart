import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        this.id,
        this.nomProduct,
        this.price,
        this.image,
    });

    String id;
    String nomProduct;
    String price;
    String image;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        nomProduct: json["nom_product"],
        price: json["price"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nom_product": nomProduct,
        "price": price,
        "image": image,
    };
}