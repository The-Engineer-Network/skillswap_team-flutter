import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';
import '../../core/utils/helpers.dart';
import '../../widgets/trending_card.dart';
import '../../widgets/category_chip.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // 🔹 Mock trending items
    final List<_TrendingItem> trendingItems = [
      _TrendingItem(
        title: 'Excel Shortcuts',
        imagePath: 'assets/images/excel.png', // put your asset here
        colorA: Colors.teal,
        colorB: Colors.green,
      ),
      _TrendingItem(
        title: 'Intro to Figma',
        imagePath: 'assets/images/figma.png',
        colorA: Colors.grey,
        colorB: Colors.brown,
      ),
      _TrendingItem(
        title: 'Python Basics',
        imagePath: 'assets/images/python.png',
        colorA: Colors.blue,
        colorB: Colors.indigo,
      ),
      _TrendingItem(
        title: 'Digital Marketing',
        imagePath: 'assets/images/marketing.png',
        colorA: Colors.orange,
        colorB: Colors.red,
      ),
      _TrendingItem(
        title: 'Photography Tips',
        imagePath: 'assets/images/camera.png',
        colorA: Colors.purple,
        colorB: Colors.pink,
      ),
      _TrendingItem(
        title: 'Guitar Lessons',
        imagePath: 'assets/images/guitar.png',
        colorA: Colors.amber,
        colorB: Colors.yellow,
      ),
      _TrendingItem(
        title: 'Mobile Development',
        imagePath: 'assets/images/mobile.png',
        colorA: Colors.cyan,
        colorB: Colors.blue,
      ),
      _TrendingItem(
        title: 'Data Science',
        imagePath: 'assets/images/data.png',
        colorA: Colors.deepPurple,
        colorB: Colors.purple,
      ),
    ];

    // 🔹 Categories
    final List<String> categories = [
      'Business',
      'Design',
      'Music',
      'Fitness',
      'Cooking',
      'Languages',
    ];

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔎 Top bar (Search + Points)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: AppStyles.h4.copyWith(
                      color:
                          isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryPurpleLight.withValues(
                        alpha: 0.2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.wallet_giftcard,
                          size: 18,
                          color: AppColors.primaryPurple,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "250",
                          style: AppStyles.bodyMedium.copyWith(
                            color: AppColors.primaryPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // 🔎 Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for skills...",
                  hintStyle: AppStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.textSecondary,
                  ),
                  filled: true,
                  fillColor: AppColors.primaryPurpleLight.withValues(
                    alpha: 0.08,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 24),

              // 🔥 Trending Section
              Text(
                "Trending",
                style: AppStyles.h5.copyWith(
                  color:
                      isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimary,
                ),
              ),

              SizedBox(height: 12),

              SizedBox(
                height: 180,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.6),
                  itemCount: trendingItems.length,
                  itemBuilder: (context, index) {
                    final item = trendingItems[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: TrendingCard(
                        width: screenWidth * 0.52,
                        title: item.title,
                        imagePath: item.imagePath,
                        gradientStart: item.colorA,
                        gradientEnd: item.colorB,
                        onTap: () {
                          Helpers.showSnackbar(context, 'Open ${item.title}');
                        },
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 24),

              // 🏷️ Categories Section
              Text(
                "Categories",
                style: AppStyles.h5.copyWith(
                  color:
                      isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimary,
                ),
              ),

              SizedBox(height: 12),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children:
                    categories
                        .map(
                          (c) => CategoryChip(
                            label: c,
                            onTap: () {
                              Helpers.showSnackbar(context, 'Open $c');
                            },
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Private model for trending data
class _TrendingItem {
  final String title;
  final String? imagePath;
  final Color colorA;
  final Color colorB;

  _TrendingItem({
    required this.title,
    this.imagePath,
    required this.colorA,
    required this.colorB,
  });
}
