import 'package:flutter/material.dart';

import '../cubit/book_cubit.dart';
import '../widgets/book_list_view.dart';

/// "Book Club Home": books sorted by author or title.
class BookListPage extends StatelessWidget {
  const BookListPage({super.key, required this.state});

  final BookState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed: () {},
        ),
        title: const Text('Book Club Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            tooltip: 'Account',
            onPressed: () {},
          ),
        ],
      ),
      body: BookListView(state: state),
    );
  }
}
