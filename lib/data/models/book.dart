import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int id;
  final String title;
  final String author;
  final String imageUrl;
  final String synopsis;
  final String rating;
  final String content;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.synopsis,
    required this.rating,
    required this.content,
  });

  const Book.empty()
      : id = 0,
        title = "",
        author = "",
        imageUrl = "",
        synopsis = "",
        rating = "",
        content = "";

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      imageUrl: json['imageUrl'],
      synopsis: json['synopsis'],
      rating: json['rating'],
      content: json['content'],
    );
  }

  @override
  String toString() {
    return "Book: $id, $title, $author, $imageUrl, $synopsis, $rating";
  }

  @override
  List<Object?> get props => [
        id,
        title,
        author,
        imageUrl,
        synopsis,
        rating,
        content,
      ];
}
