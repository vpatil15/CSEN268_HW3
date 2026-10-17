import '../models/book.dart';

String _cover(String name) => 'assets/images/$name.jpg';

/// Seed data loaded by `BookCubit.init()`.
final List<Book> bookData = [
  Book(
    id: '1',
    title: 'James',
    author: 'Percival Everett',
    imagePath: _cover('james'),
    description:
        'A retelling of Adventures of Huckleberry Finn from the point of view '
        'of Jim, the enslaved man who flees down the Mississippi alongside '
        'Huck. Everett gives Jim a voice of his own, sharp, funny and '
        'unflinching, as he fights to reach freedom and reunite with his '
        'family.',
  ),
  Book(
    id: '2',
    title: 'Little Gods',
    author: 'Meng Jin',
    imagePath: _cover('little_gods'),
    description:
        'After the death of her mother, a physicist who fled China after 1989, '
        'Liya travels to Beijing to piece together who her mother really was. '
        'A novel about memory, time and the distance between parents and '
        'children.',
  ),
  Book(
    id: '3',
    title: 'Project Hail Mary',
    author: 'Andy Weir',
    imagePath: _cover('project_hail_mary'),
    description:
        'A science teacher wakes up alone on a spaceship with no memory of how '
        'he got there, only to discover he is humanity\'s last hope against '
        'a threat to the sun. Problem-solving, humor and an unlikely '
        'friendship drive the story.',
  ),
  Book(
    id: '4',
    title: 'Lessons in Chemistry',
    author: 'Bonnie Garmus',
    imagePath: _cover('lessons_in_chemistry'),
    description:
        'In the early 1960s, chemist Elizabeth Zott is pushed out of her lab '
        'and ends up hosting a TV cooking show, where she teaches viewers '
        'science and quietly encourages them to question the status quo.',
  ),
  Book(
    id: '5',
    title: 'Tomorrow, and Tomorrow, and Tomorrow',
    author: 'Gabrielle Zevin',
    imagePath: _cover('tomorrow'),
    description:
        'Two childhood friends reunite in college and begin designing video '
        'games together. Over three decades the novel follows their '
        'partnership, their successes and failures, and the complicated love '
        'between collaborators.',
  ),
  Book(
    id: '6',
    title: 'Demon Copperhead',
    author: 'Barbara Kingsolver',
    imagePath: _cover('demon_copperhead'),
    description:
        'Inspired by David Copperfield and set in Appalachia, this novel '
        'follows a boy born to a single teenage mother as he navigates foster '
        'care, child labor and the opioid crisis with resilience and wit.',
  ),
  Book(
    id: '7',
    title: 'The Women',
    author: 'Kristin Hannah',
    imagePath: _cover('the_women'),
    description:
        'Frankie McGrath joins the Army Nurse Corps and serves in Vietnam, '
        'then returns home to a country that does not want to acknowledge the '
        'women who served. A story of courage, friendship and recovery.',
  ),
  Book(
    id: '8',
    title: 'Fourth Wing',
    author: 'Rebecca Yarros',
    imagePath: _cover('fourth_wing'),
    description:
        'Violet Sorrengail is forced into an elite war college for dragon '
        'riders, where cadets must bond with dragons or die trying. A fantasy '
        'of rivalry, danger and romance.',
  ),
];
