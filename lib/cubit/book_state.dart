part of 'book_cubit.dart';

enum SortBy { author, title }

sealed class BookState extends Equatable {
  const BookState({required this.sortBy});

  final SortBy sortBy;

  @override
  List<Object?> get props => [sortBy];
}

/// Shown while the list is being (re)built. Emitting this between two list
/// states guarantees a rebuild even when the next list state is equal.
class BookLoading extends BookState {
  const BookLoading({required super.sortBy});
}

class BookListState extends BookState {
  const BookListState({required this.books, required super.sortBy});

  final List<Book> books;

  @override
  List<Object?> get props => [books, sortBy];
}

class BookDetailState extends BookState {
  const BookDetailState({required this.book, required super.sortBy});

  final Book book;

  @override
  List<Object?> get props => [book, sortBy];
}
