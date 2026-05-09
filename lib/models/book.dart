class Book {
  final String id;
  final String title;
  final String author;
  final String coverColor;
  final String coverText;
  final double rating;
  final int reviews;
  final int pages;
  final String description;
  final bool isPremium;
  final double progress;
  final String status; // 'reading', 'finished', 'to_read'
  final String category;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverColor,
    required this.coverText,
    required this.rating,
    required this.reviews,
    required this.pages,
    required this.description,
    this.isPremium = false,
    this.progress = 0.0,
    this.status = 'to_read',
    this.category = 'General',
  });
}

final List<Book> sampleBooks = [
  Book(
    id: '1',
    title: 'Ego is the Enemy',
    author: 'Ryan Holiday',
    coverColor: '#1A237E',
    coverText: 'EGO IS THE ENEMY',
    rating: 4.8,
    reviews: 46,
    pages: 321,
    description:
        'The ego is the enemy of what you want and of what you have: Of mastering a craft. Of real relationships. Of building an empire. This book draws on a vast array of stories and examples, from literature to philosophy to history.',
    progress: 1.0,
    status: 'finished',
    category: 'Self Help',
  ),
  Book(
    id: '2',
    title: 'Night Flights',
    author: 'Philip Reeve',
    coverColor: '#0D1B2A',
    coverText: 'NIGHT FLIGHTS',
    rating: 4.5,
    reviews: 32,
    pages: 256,
    description:
        'A thrilling adventure set in a world of flying cities and ancient machines. Three short stories that expand the Mortal Engines universe.',
    progress: 0.83,
    status: 'reading',
    category: 'Fiction',
  ),
  Book(
    id: '3',
    title: 'The Forty Rules of Love',
    author: 'Elif Shafak',
    coverColor: '#8B0000',
    coverText: 'FORTY RULES OF LOVE',
    rating: 4.7,
    reviews: 89,
    pages: 368,
    description:
        'A tale of two love stories—one set in the present day, one in the 13th century—that explores the bond between Rumi and Shams of Tabriz.',
    progress: 0.45,
    status: 'reading',
    category: 'Romance',
  ),
  Book(
    id: '4',
    title: 'The Name of the Rose',
    author: 'Umberto Eco',
    coverColor: '#C62828',
    coverText: 'THE NAME OF THE ROSE',
    rating: 4.8,
    reviews: 46,
    pages: 321,
    description:
        'A medieval mystery set in an Italian monastery, following a Franciscan friar and his novice as they investigate a series of mysterious deaths.',
    isPremium: true,
    progress: 0.0,
    status: 'to_read',
    category: 'Mystery',
  ),
  Book(
    id: '5',
    title: 'The In-Between',
    author: 'Hadley Vlahos',
    coverColor: '#F9A825',
    coverText: 'The In-Between',
    rating: 4.6,
    reviews: 54,
    pages: 288,
    description:
        'A hospice nurse shares extraordinary stories of patients in their final days and the gifts of love and healing those moments hold.',
    progress: 0.0,
    status: 'to_read',
    category: 'Biography',
  ),
  Book(
    id: '6',
    title: 'Holly',
    author: 'Stephen King',
    coverColor: '#1B5E20',
    coverText: 'HOLLY',
    rating: 4.4,
    reviews: 120,
    pages: 449,
    description:
        'Holly Gibney is one of Stephen King\'s most compelling characters. In this standalone novel, Holly must overcome her own self-doubts and take on two pair of killers.',
    progress: 0.0,
    status: 'to_read',
    category: 'Thriller',
  ),
  Book(
    id: '7',
    title: 'Felix Ever After',
    author: 'Kacen Callender',
    coverColor: '#E65100',
    coverText: 'FELIX EVER AFTER',
    rating: 4.3,
    reviews: 67,
    pages: 368,
    description:
        'Felix Love has never been in love—and, yes, he\'s painfully aware of the irony. He desperately wants to experience heartbreak and a first love.',
    progress: 0.0,
    status: 'to_read',
    category: 'YA',
  ),
];
