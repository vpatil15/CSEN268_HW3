import 'package:csen268_hw3/cubit/book_cubit.dart';
import 'package:csen268_hw3/data/book_data.dart';
import 'package:csen268_hw3/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BookCubit', () {
    test('starts loading with no books, init fills and sorts by author',
        () async {
      final cubit = BookCubit(loadingDelay: Duration.zero);
      expect(cubit.state, isA<BookLoading>());
      await cubit.init();
      final state = cubit.state as BookListState;
      expect(state.sortBy, SortBy.author);
      expect(state.books.length, bookData.length);
      final authors = state.books.map((b) => b.author.toLowerCase()).toList();
      expect(authors, [...authors]..sort());
      await cubit.close();
    });

    test('sort by title, detail, then back keeps the sort', () async {
      final cubit = BookCubit(loadingDelay: Duration.zero);
      await cubit.init();
      await cubit.sortBooks(SortBy.title);
      final list = cubit.state as BookListState;
      final titles = list.books.map((b) => b.title.toLowerCase()).toList();
      expect(titles, [...titles]..sort());

      cubit.showBookDetail(list.books.first);
      expect(cubit.state, isA<BookDetailState>());

      cubit.showBookList();
      final back = cubit.state as BookListState;
      expect(back.sortBy, SortBy.title);
      expect(back.books, list.books);
      await cubit.close();
    });

    test('re-selecting the same sort passes through loading', () async {
      final cubit = BookCubit(loadingDelay: Duration.zero);
      await cubit.init();
      final emitted = <BookState>[];
      final sub = cubit.stream.listen(emitted.add);
      await cubit.sortBooks(SortBy.author);
      await Future<void>.delayed(Duration.zero);
      expect(emitted.first, isA<BookLoading>());
      expect(emitted.last, isA<BookListState>());
      await sub.cancel();
      await cubit.close();
    });
  });

  testWidgets('list -> detail -> back', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (_) => BookCubit(loadingDelay: Duration.zero)..init(),
        child: const HomePage(),
      ),
    ));
    await tester.pump(const Duration(milliseconds: 10));
    expect(find.text('Book Club Home'), findsOneWidget);
    expect(find.text('Books'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('book-3')));
    await tester.pump();
    expect(find.text('Book Detail'), findsOneWidget);
    expect(find.text('Andy Weir'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pump();
    expect(find.text('Book Club Home'), findsOneWidget);
  });
}
