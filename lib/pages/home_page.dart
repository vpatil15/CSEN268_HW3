import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/book_cubit.dart';
import 'book_detail_page.dart';
import 'book_list_page.dart';

/// Shows the page that matches the current [BookCubit] state: the book list
/// (sorted by author or title) or the selected book's detail page.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) => switch (state) {
        BookDetailState(:final book) => BookDetailPage(book: book),
        _ => BookListPage(state: state),
      },
    );
  }
}
