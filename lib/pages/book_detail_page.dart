import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/book_cubit.dart';
import '../models/book.dart';
import '../widgets/book_detail_view.dart';

/// "Book Detail": the selected book's image, title, author and description.
class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookCubit>();
    return PopScope(
      // System back returns to the list instead of closing the app.
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) cubit.showBookList();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          // Leading widget connected to the cubit: emits the book list state.
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Back to books',
            onPressed: cubit.showBookList,
          ),
          title: const Text('Book Detail'),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              tooltip: 'Account',
              onPressed: () {},
            ),
          ],
        ),
        body: BookDetailView(book: book),
      ),
    );
  }
}
