import 'package:flutter/material.dart';

import '../models/book.dart';
import 'book_cover.dart';

/// Widget 2: displays the book's image, title, author and description.
class BookDetailView extends StatelessWidget {
  const BookDetailView({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookCover(book: book, width: 180),
          const SizedBox(height: 16),
          Text(book.title, style: textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(book.author, style: textTheme.titleMedium),
          const SizedBox(height: 12),
          Text(book.description, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
