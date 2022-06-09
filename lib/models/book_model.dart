class BookModel {
  BookModel({
    this.title,
    this.subtitle,
    this.isbn13,
    this.imageUrl,
    this.url,
    this.price,
  });

  String? title;
  String? subtitle;
  String? isbn13;
  String? imageUrl;
  String? url;
  String? price;

  factory BookModel.fromJson(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'],
      subtitle: map['subtitle'],
      isbn13: map['isbn13'],
      imageUrl: map['image'],
      url: map['url'],
      price: map['price'],
    );
  }

}
