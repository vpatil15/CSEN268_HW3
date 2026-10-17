import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../cubit/book_cubit.dart';
import '../models/book.dart';
import 'book_cover.dart';

const double _coverWidth = 110;
const double _rowHeight = _coverWidth * 1.5;

/// "Sort by" selector, "Books" heading and the horizontal row of covers.
class BookListView extends StatelessWidget {
  const BookListView({super.key, required this.state});

  final BookState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookCubit>();
    final state = this.state;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            const Text('Sort by'),
            const SizedBox(width: 12),
            SegmentedButton<SortBy>(
              showSelectedIcon: false,
              segments: const [
                ButtonSegment(value: SortBy.author, label: Text('Author')),
                ButtonSegment(value: SortBy.title, label: Text('Title')),
              ],
              selected: {state.sortBy},
              onSelectionChanged: (selection) =>
                  cubit.sortBooks(selection.first),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text('Books', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        SizedBox(
          height: _rowHeight,
          child: switch (state) {
            BookListState(:final books) => _BookRow(books: books),
            _ => const _ShimmerRow(),
          },
        ),
      ],
    );
  }
}

class _BookRow extends StatelessWidget {
  const _BookRow({required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: books.length,
      separatorBuilder: (_, _) => const SizedBox(width: 8),
      itemBuilder: (context, index) {
        final book = books[index];
        return InkWell(
          key: ValueKey('book-${book.id}'),
          onTap: () => context.read<BookCubit>().showBookDetail(book),
          child: Tooltip(
            message: '${book.title} — ${book.author}',
            child: BookCover(book: book, width: _coverWidth),
          ),
        );
      },
    );
  }
}

class _ShimmerRow extends StatelessWidget {
  const _ShimmerRow();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Shimmer.fromColors(
      baseColor: scheme.surfaceContainerHighest,
      highlightColor: scheme.surface,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (_, _) => Container(
          width: _coverWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
