import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/book_data.dart';
import '../models/book.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit({this.loadingDelay = const Duration(milliseconds: 600)})
      : super(const BookLoading(sortBy: SortBy.author));

  /// How long the shimmer is shown while the list is being prepared.
  final Duration loadingDelay;

  /// Starts empty and is filled in by [init].
  List<Book> _books = [];

  Future<void> init() async {
    _books = List.of(bookData);
    await sortBooks(SortBy.author);
  }

  Future<void> sortBooks(SortBy sortBy) async {
    emit(BookLoading(sortBy: sortBy));
    await Future.delayed(loadingDelay);
    if (isClosed) return;

    final sorted = List.of(_books)
      ..sort((a, b) => switch (sortBy) {
            SortBy.author =>
              a.author.toLowerCase().compareTo(b.author.toLowerCase()),
            SortBy.title =>
              a.title.toLowerCase().compareTo(b.title.toLowerCase()),
          });
    _books = sorted;
    emit(BookListState(books: List.unmodifiable(sorted), sortBy: sortBy));
  }

  void showBookDetail(Book book) {
    emit(BookDetailState(book: book, sortBy: state.sortBy));
  }

  /// Called by the leading back button on the detail page.
  void showBookList() {
    emit(BookListState(books: List.unmodifiable(_books), sortBy: state.sortBy));
  }
}
