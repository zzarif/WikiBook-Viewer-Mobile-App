
class Book {
  String title;
  String author;
  String country;
  String imageLink;
  String language;
  String link;
  int pages;
  int year;

  Book({
    required this.title,
    required this.author,
    required this.country,
    required this.imageLink,
    required this.language,
    required this.link,
    required this.pages,
    required this.year
  });

  factory Book.fromJson(Map<String,dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
      country: json['country'],
      imageLink: json['imageLink'],
      language: json['language'],
      link: json['link'],
      pages: json['pages'],
      year: json['year'],
    );
  }
}