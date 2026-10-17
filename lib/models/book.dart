import 'package:equatable/equatable.dart';

class Book extends Equatable {
  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imagePath,
  });

  final String id;
  final String title;
  final String author;
  final String description;
  /// Path to the bundled cover image under assets/images.
  final String imagePath;

  @override
  List<Object?> get props => [id, title, author, description, imagePath];
}
