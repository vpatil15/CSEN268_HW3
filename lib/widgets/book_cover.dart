import 'package:flutter/material.dart';

import '../models/book.dart';

/// Widget 1: displays only the book's image.
class BookCover extends StatelessWidget {
  const BookCover({super.key, required this.book, this.width = 110});

  final Book book;
  final double width;

  @override
  Widget build(BuildContext context) {
    final height = width * 1.5;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.asset(
        book.imagePath,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            _Placeholder(width: width, height: height, title: book.title),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({
    required this.width,
    required this.height,
    required this.title,
  });

  final double width;
  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: width,
      height: height,
      color: scheme.surfaceContainerHighest,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: scheme.onSurfaceVariant),
      ),
    );
  }
}
