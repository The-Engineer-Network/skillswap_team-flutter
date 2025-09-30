import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillswap/core/constants/app_colors.dart';
import 'package:skillswap/core/constants/app_strings.dart';
import 'package:skillswap/core/constants/app_styles.dart';

// Mock data models
class Skill {
  final String title;
  final String description;
  final String imageUrl;
  final String duration;
  final double averageRating;
  final int reviewCount;
  final Map<int, double> ratingDistribution;
  final List<Review> reviews;

  Skill({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.duration,
    required this.averageRating,
    required this.reviewCount,
    required this.ratingDistribution,
    required this.reviews,
  });
}

class Review {
  final String userName;
  final String userImageUrl;
  final String timeAgo;
  final int rating;
  final String comment;
  final int likes;
  final int dislikes;

  Review({
    required this.userName,
    required this.userImageUrl,
    required this.timeAgo,
    required this.rating,
    required this.comment,
    required this.likes,
    required this.dislikes,
  });
}

// Provider for managing skill detail state
class SkillDetailProvider extends ChangeNotifier {
  Skill? _skill;
  bool _isLoading = false;
  String? _error;

  Skill? get skill => _skill;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Method to fetch skill details
  Future<void> fetchSkillDetails(String skillId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Add API call here when backend is ready
      // Example: final response = await apiService.getSkillDetails(skillId);
      // _skill = Skill.fromJson(response.data);

      // For now, use mock data
      _skill = Skill(
        title: 'Photography Basics',
        description:
            'Learn the fundamentals of photography, including camera settings, composition, and lighting techniques.',
        imageUrl: 'assets/skill_detail_imgs/camera.jpeg',
        duration: '1 hour session',
        averageRating: 4.8,
        reviewCount: 120,
        ratingDistribution: {5: 0.7, 4: 0.2, 3: 0.05, 2: 0.03, 1: 0.02},
        reviews: [
          Review(
            userName: 'Sophia Carter',
            userImageUrl: 'https://example.com/sophia.jpg',
            timeAgo: '2 weeks ago',
            rating: 5,
            comment:
                'Sophia was an amazing teacher! She explained everything clearly and made the session fun and engaging. I learned so much in just one hour.',
            likes: 15,
            dislikes: 2,
          ),
          Review(
            userName: 'Ethan Bennett',
            userImageUrl: 'https://example.com/ethan.jpg',
            timeAgo: '1 month ago',
            rating: 4,
            comment:
                'Ethan\'s session was very informative. I appreciated his practical approach and personalized feedback on my photos.',
            likes: 8,
            dislikes: 1,
          ),
        ],
      );
    } catch (e) {
      _error = 'Failed to load skill details: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class SkillDetailScreen extends StatefulWidget {
  final String skillId; // Pass the skill ID to fetch details

  const SkillDetailScreen({super.key, required this.skillId});

  @override
  State<SkillDetailScreen> createState() => _SkillDetailScreenState();
}

class _SkillDetailScreenState extends State<SkillDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data using Provider when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SkillDetailProvider>(
        context,
        listen: false,
      ).fetchSkillDetails(widget.skillId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(AppStrings.skillDetails, style: AppStyles.getH2(context)),
      ),
      body: SafeArea(
        // Added to prevent overflow into app bar
        child: Consumer<SkillDetailProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (provider.error != null) {
              return Center(
                child: Text(
                  provider.error!,
                  style: AppStyles.getBodyMedium(context),
                ),
              );
            }
            final skill = provider.skill;
            if (skill == null) {
              return Center(
                child: Text(
                  AppStrings.noSkillsFound,
                  style: AppStyles.getBodyMedium(context),
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppStyles.size16,
                    ), // Maintains width constraint
                    child: Card(
                      margin: EdgeInsets.zero, // No extra margin
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(AppStyles.radius16),
                        ),
                      ),
                      elevation: 4,
                      child: Container(
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(AppStyles.radius16),
                          ),
                          child: Image.asset(
                            skill.imageUrl,
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppStyles.size16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(skill.title, style: AppStyles.getH2(context)),
                        SizedBox(height: AppStyles.size8),
                        Text(
                          '${skill.description}\n${skill.duration}',
                          style: AppStyles.getBodyMedium(context),
                        ),
                        SizedBox(height: AppStyles.size24),
                        Text(
                          AppStrings.reviews,
                          style: AppStyles.getH2(context),
                        ),
                        SizedBox(height: AppStyles.size8),
                        Row(
                          children: [
                            Text(
                              skill.averageRating.toStringAsFixed(1),
                              style: AppStyles.getH2(context),
                            ),
                            Icon(Icons.star, color: AppColors.primaryPurple),
                            SizedBox(width: AppStyles.size8),
                            Text(
                              '${skill.reviewCount} reviews',
                              style: AppStyles.bodySmall,
                            ),
                          ],
                        ),
                        SizedBox(height: AppStyles.size16),
                        Column(
                          children:
                              [5, 4, 3, 2, 1].map((stars) {
                                final percentage =
                                    (skill.ratingDistribution[stars] ?? 0) *
                                    100;
                                return Row(
                                  children: [
                                    Text('$stars', style: AppStyles.bodySmall),
                                    SizedBox(width: AppStyles.size8),
                                    Expanded(
                                      child: Container(
                                        height: AppStyles.size8,
                                        decoration: BoxDecoration(
                                          color: AppColors.gray300,
                                          borderRadius: BorderRadius.circular(
                                            AppStyles.radius4,
                                          ),
                                        ),
                                        child: FractionallySizedBox(
                                          alignment: Alignment.centerLeft,
                                          widthFactor:
                                              skill.ratingDistribution[stars] ??
                                              0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryPurple,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    AppStyles.radius4,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: AppStyles.size8),
                                    Text(
                                      '${percentage.toInt()}%',
                                      style: AppStyles.bodySmall,
                                    ),
                                  ],
                                );
                              }).toList(),
                        ),
                        SizedBox(height: AppStyles.size24),
                        ...skill.reviews.map(
                          (review) => ReviewCard(review: review),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppStyles.size16, vertical: AppStyles.size8),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Add booking logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                padding: EdgeInsets.symmetric(vertical: AppStyles.size12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppStyles.radius24)),
              ),
              child: const Text('Book (1 Credit)', style: AppStyles.buttonSmall), //hardcoded text
            ),
          ),
          BottomNavigationBar(
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Sessions',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        type: BottomNavigationBarType.fixed,
      ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: AppStyles.size16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyles.radius16),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppStyles.size16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    review.userImageUrl,
                  ), //avater img
                  radius: AppStyles.size24,
                ),
                SizedBox(width: AppStyles.size8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      style: AppStyles.getBodyMedium(context),
                    ),
                    Text(review.timeAgo, style: AppStyles.getCaption(context)),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppStyles.size8),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < review.rating ? Icons.star : Icons.star_border,
                  color: AppColors.iconActive,
                  size: AppStyles.size16,
                );
              }),
            ),
            SizedBox(height: AppStyles.size8),
            Text(review.comment, style: AppStyles.getBodyMedium(context)),
            SizedBox(height: AppStyles.size8),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up, color: AppColors.iconDefault),
                  onPressed: () {
                    // TODO: Add like API call here
                  },
                ),
                Text(
                  '${review.likes}',
                  style: AppStyles.getBodySmall(context),
                ), //small
                IconButton(
                  icon: Icon(Icons.thumb_down, color: AppColors.iconDefault),
                  onPressed: () {
                    // TODO: Add dislike API call here
                  },
                ),
                Text(
                  '${review.dislikes}',
                  style: AppStyles.getBodySmall(context), //small
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Usage example: Wrap your app or this screen with ChangeNotifierProvider
// In your main.dart or parent widget:
// ChangeNotifierProvider(
//   create: (_) => SkillDetailProvider(),
//   child: SkillDetailScreen(skillId: 'photography-basics'),
// );
