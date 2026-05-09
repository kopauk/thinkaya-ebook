import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/book.dart';
import '../../widgets/book_cover.dart';
import '../book_detail_screen.dart';
import '../notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _bannerController = PageController();
  int _bannerPage = 0;

  final List<Map<String, String>> _banners = [
    {
      'title': 'Book Store Discount.',
      'subtitle': 'Upto 40% off on selected favourite book',
      'action': 'Claim',
    },
    {
      'title': 'New Arrivals!',
      'subtitle': 'Check out this week\'s best picks',
      'action': 'Browse',
    },
    {
      'title': 'Read & Earn',
      'subtitle': 'Get points for every book you finish',
      'action': 'Learn More',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final continueReading =
        sampleBooks.where((b) => b.status == 'reading' || b.status == 'finished').toList();
    final topOfWeek = sampleBooks.where((b) => b.status == 'to_read').toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.black),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.notifications_outlined,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NotificationsScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Banner Carousel
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: PageView.builder(
                      controller: _bannerController,
                      itemCount: _banners.length,
                      onPageChanged: (i) => setState(() => _bannerPage = i),
                      itemBuilder: (_, i) => _BannerCard(data: _banners[i]),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _banners.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: _bannerPage == i ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _bannerPage == i
                              ? AppColors.primary
                              : AppColors.primary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Continue Reading
            SliverToBoxAdapter(
              child: _SectionHeader(
                title: 'Continue Reading',
                onSeeAll: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: continueReading.length,
                  itemBuilder: (_, i) {
                    final book = continueReading[i];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookDetailScreen(book: book),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: BookCoverWidget(
                          book: book,
                          width: 110,
                          height: 155,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Top of Week
            SliverToBoxAdapter(
              child: _SectionHeader(title: 'Top of Week', onSeeAll: () {}),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: topOfWeek.length,
                  itemBuilder: (_, i) {
                    final book = topOfWeek[i];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookDetailScreen(book: book),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: BookCoverWidget(
                          book: book,
                          width: 110,
                          height: 155,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}

class _BannerCard extends StatelessWidget {
  final Map<String, String> data;

  const _BannerCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5D88E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Book illustration placeholder
          Positioned(
            left: 12,
            top: 16,
            bottom: 16,
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                color: Colors.orange.shade700,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.auto_stories,
                  color: Colors.white, size: 40),
            ),
          ),
          // Text content
          Positioned(
            left: 110,
            right: 12,
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['title']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data['subtitle']!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    data['action']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const _SectionHeader({required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: const Text(
              'Sell All',
              style: TextStyle(
                color: AppColors.accent,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
