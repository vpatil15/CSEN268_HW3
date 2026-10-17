# Book Club App (CSEN 268 - HW3)

A small Flutter app that shows a list of books. You can sort the books
by Author or by Title, tap a book to see its details, and go back to the
list with the back arrow.

All screen changes are controlled by a **Cubit** (from the `flutter_bloc`
package).


## What the app does

1. **Home page ("Book Club Home")**
   - Shows the book covers in a row that scrolls sideways.
   - Books are sorted by **Author** when the app starts.
   - Tap **Title** to sort by title, or **Author** to sort by author.
   - While the list is being sorted, a short grey "shimmer" (loading
     effect) is shown.

2. **Detail page ("Book Detail")**
   - Tap any book cover to open it.
   - Shows the book's cover, title, author and description.
   - Tap the **back arrow** at the top left to return to the list.
     The list keeps the sort you picked before.


## How to run it

You need Flutter installed. Then, inside this folder, run:

    flutter pub get
    flutter run

Pick a device when asked (for example macOS, Chrome or a phone
simulator).

To run the tests:

    flutter test

The book covers are saved inside the app, so no internet is needed.


## How the code is organized

    lib/
      main.dart                  Starts the app and creates the Cubit
      models/book.dart           The Book class
      data/book_data.dart        The list of 8 books
      cubit/book_cubit.dart      The Cubit: loads, sorts and switches pages
      cubit/book_state.dart      The states the app can be in
      pages/home_page.dart       Picks which page to show based on the state
      pages/book_list_page.dart  The home page (list of books)
      pages/book_detail_page.dart  The detail page (one book)
      widgets/book_cover.dart    Widget 1: shows only the book's image
      widgets/book_detail_view.dart  Widget 2: image, title, author, description
      widgets/book_list_view.dart    Sort buttons and the row of covers
    assets/images/               The book cover pictures
    test/widget_test.dart        Tests for the Cubit and the screens


## How the Cubit works (in simple words)

Think of the Cubit as the "brain" of the app. The screen never changes
by itself. It only redraws when the Cubit sends out (emits) a new
**state**.

The app has 3 states:

| State             | What you see                          |
|-------------------|---------------------------------------|
| `BookLoading`     | The grey shimmer while books are sorted |
| `BookListState`   | The home page with the sorted books   |
| `BookDetailState` | The detail page for one book          |

The Cubit has these functions:

| Function                | When it runs                 | What it does |
|-------------------------|------------------------------|--------------|
| `init()`                | When the app starts          | Fills the empty book list and sorts it by author |
| `sortBooks(author/title)` | When you tap Author or Title | Shows the shimmer, sorts the list, then shows the list |
| `showBookDetail(book)`  | When you tap a book cover    | Shows the detail page for that book |
| `showBookList()`        | When you tap the back arrow  | Shows the book list again |




## Packages used

- `flutter_bloc` - for the Cubit
- `equatable` - to compare states easily
- `shimmer` - for the loading effect



