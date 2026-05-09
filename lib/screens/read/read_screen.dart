import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/book.dart';
import '../../widgets/book_cover.dart';
import '../book_detail_screen.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'To Read', 'Reading', 'Finished'];
  final _searchController = TextEditingController();
  String _searchQuery = '';

  List<Book> get _filteredBooks {
    var books = sampleBooks;
    if (_selectedFilter != 'All') {
      final map = {'To Read': 'to_read', 'Reading': 'reading', 'Finished': 'finished'};
      books = books.where((b) => b.status == map[_selectedFilter]).toList();
    }
    if (_searchQuery.isNotEmpty) {
      books = books
          .where((b) =>
              b.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              b.author.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
    return books;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: TextField(
                controller: _searchController,
                onChanged: (v) => setState(() => _searchQuery = v),
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
            ),
            // Filter tabs
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: _filters.length,
                itemBuilder: (_, i) {
                  final selected = _selectedFilter == _filters[i];
                  return GestureDetector(
                    onTap: () => setState(() => _selectedFilter = _filters[i]),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color:
                            selected ? AppColors.primary : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected
                              ? AppColors.primary
                              : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        _filters[i],
                        style: TextStyle(
                          color: selected ? Colors.white : AppColors.textSecondary,
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            // Book list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filteredBooks.length,
                itemBuilder: (_, i) => _BookListItem(
                  book: _filteredBooks[i],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookDetailScreen(book: _filteredBooks[i]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookListItem extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const _BookListItem({required this.book, required this.onTap});

  String get _statusLabel {
    switch (book.status) {
      case 'reading':
        return 'Reading';
      case 'finished':
        return 'Finished';
      case 'to_read':
        return 'To Read';
      default:
        return '';
    }
  }

  IconData get _statusIcon {
    switch (book.status) {
      case 'reading':
        return Icons.menu_book_outlined;
      case 'finished':
        return Icons.check_circle_outline;
      case 'to_read':
        return Icons.bookmark_outline;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookCoverWidget(book: book, width: 90, height: 120),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        book.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            book.author,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(_statusIcon,
                              size: 14, color: AppColors.primary),
                          const SizedBox(width: 4),
                          Text(
                            _statusLabel,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 12,
                            ),
                          ),
                          if (book.category.isNotEmpty) ...[
                            const SizedBox(width: 8),
                            Text(
                              book.category,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                          const Spacer(),
                          Text(
                            '${(book.progress * 100).toInt()}%',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: book.progress,
                          backgroundColor: AppColors.progressBg,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                          minHeight: 6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
          ],
        ),
      ),
    );
  }
}
