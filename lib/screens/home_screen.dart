import 'package:flutter/material.dart';
import 'package:home_service_app/services/appTextStyle.dart';
import 'package:home_service_app/services/appcolors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> sliderImages = const [
    'https://images.unsplash.com/photo-1563013544-824ae1b704d3?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1581578731548-c64695cc6952?w=800&h=400&fit=crop',
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAppBar(context),
              _buildLocationBar(context),
              SizedBox(height: screenHeight * 0.02),
              _buildImageSlider(context),
              SizedBox(height: screenHeight * 0.025),
              _buildServiceCategories(context),
              SizedBox(height: screenHeight * 0.01),
              _buildPopularServices(context),
              SizedBox(height: screenHeight * 0.025),
              _buildCleaningServices(context),
              SizedBox(height: screenHeight * 0.025),
              _buildFeatures(context),
              SizedBox(height: screenHeight * 0.03),
              _buildWhyChooseUs(context),
              SizedBox(height: screenHeight * 0.03),
              _buildSafetyMeasures(context),
              SizedBox(height: screenHeight * 0.03),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 24.0 : 16.0;
    final iconSize = screenWidth > 600 ? 24.0 : 20.0;
    final fontSize = screenWidth > 600 ? 20.0 : 18.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 12,
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_city,
            color: AppColors.textPrimary,
            size: iconSize,
          ),
          const SizedBox(width: 8),
          Text(
            'Home',
            style: AppTextStyles.heading.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(screenWidth > 600 ? 10 : 8),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.notifications_none,
              color: AppColors.textPrimary,
              size: iconSize,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 24.0 : 16.0;
    final iconSize = screenWidth > 600 ? 18.0 : 16.0;
    final fontSize = screenWidth > 600 ? 14.0 : 12.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        children: [
          Icon(Icons.location_on, color: AppColors.iconGrey, size: iconSize),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              'Inner Circle, Connaught Place, New Delhi...',
              style: AppTextStyles.small.copyWith(
                color: AppColors.textSecondary,
                fontSize: fontSize,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.iconGrey,
            size: iconSize,
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 24.0 : 16.0;
    final sliderHeight =
        screenWidth > 900 ? 200.0 : (screenWidth > 600 ? 180.0 : 140.0);
    final fontSize = screenWidth > 600 ? 22.0 : 18.0;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      height: sliderHeight,
      child: PageView.builder(
        itemCount: sliderImages.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(sliderImages[index], fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.2),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Text(
                      'Home Cleaning',
                      style: AppTextStyles.heading.copyWith(
                        color: Colors.white,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildServiceCategories(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 24.0 : 16.0;
    final crossAxisCount = screenWidth > 900 ? 3 : (screenWidth > 600 ? 3 : 3);
    final childAspectRatio = screenWidth > 600 ? 1.0 : 0.9;
    final crossAxisSpacing = screenWidth > 600 ? 20.0 : 16.0;
    final mainAxisSpacing = screenWidth > 600 ? 30.0 : 16.0;

    final services = [
      {'name': 'Renovation', 'image': 'assets/images/Renovation.png'},
      {'name': 'Handyman', 'image': 'assets/images/Handyman.png'},
      {'name': 'Home shifting', 'image': 'assets/images/surface.png'},
      {'name': 'Gardening', 'image': 'assets/images/Gardening.png'},
      {'name': 'Declutter', 'image': 'assets/images/Declutter.png'},
      {'name': 'Painting', 'image': 'assets/images/Moving.png'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return _serviceIcon(
            context,
            services[index]['name'] as String,
            services[index]['image'] as String,
          );
        },
      ),
    );
  }

  Widget _serviceIcon(BuildContext context, String label, String imagePath) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerSize = screenWidth > 600 ? 80.0 : 70.0;
    final fontSize = screenWidth > 600 ? 14.0 : 12.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: containerSize,
          width: containerSize,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth > 600 ? 16.0 : 14.0),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.small.copyWith(
            fontSize: fontSize,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ],
    );
  }

  Widget _buildPopularServices(BuildContext context) {
    return Column(
      children: [
        _sectionTitle(context, 'Popular Services'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        _buildServiceRow(context, [
          {
            'title': 'Kitchen Cleaning',
            'image':
                'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop',
          },
          {
            'title': 'Sofa Cleaning',
            'image':
                'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=300&fit=crop',
          },
          {
            'title': 'Full Home',
            'image':
                'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=400&h=300&fit=crop',
          },
        ]),
      ],
    );
  }

  Widget _buildCleaningServices(BuildContext context) {
    return Column(
      children: [
        _sectionTitle(context, 'Cleaning Services'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        _buildServiceRow(context, [
          {
            'title': 'Kitchen Cleaning',
            'image':
                'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop',
          },
          {
            'title': 'Sofa Cleaning',
            'image':
                'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=300&fit=crop',
          },
          {
            'title': 'Full Home',
            'image':
                'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=400&h=300&fit=crop',
          },
        ]),
      ],
    );
  }

  Widget _buildServiceRow(
    BuildContext context,
    List<Map<String, String>> services,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 24.0 : 16.0;
    final cardSpacing = screenWidth > 600 ? 16.0 : 12.0;

    if (screenWidth > 900) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          children:
              services.map((service) {
                final isLast = service == services.last;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: isLast ? 0 : cardSpacing),
                    child: _serviceCard(
                      context,
                      service['title']!,
                      service['image']!,
                    ),
                  ),
                );
              }).toList(),
        ),
      );
    } else {
      return SizedBox(
        height: screenWidth > 600 ? 100 : 80,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          scrollDirection: Axis.horizontal,
          itemCount: services.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                right: index < services.length - 1 ? cardSpacing : 0,
              ),
              child: SizedBox(
                width: screenWidth > 600 ? 160 : 120,
                child: _serviceCard(
                  context,
                  services[index]['title']!,
                  services[index]['image']!,
                ),
              ),
            );
          },
        ),
      );
    }
  }

  Widget _sectionTitle(BuildContext context, String title) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 24.0 : 16.0;
    final fontSize = screenWidth > 600 ? 18.0 : 16.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: AppTextStyles.sectionTitle.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _serviceCard(BuildContext context, String title, String imageUrl) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardHeight = screenWidth > 600 ? 100.0 : 80.0;
    final fontSize = screenWidth > 600 ? 14.0 : 12.0;

    return Container(
      height: cardHeight,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(imageUrl, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Text(
                title,
                style: AppTextStyles.small.copyWith(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatures(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 24.0 : 16.0;
    final featureHeight = screenWidth > 600 ? 110.0 : 90.0;

    final features = [
      {'icon': Icons.verified, 'text': 'On Demand\nScreened'},
      {'icon': Icons.verified_user, 'text': 'Verified\nPartners'},
      {'icon': Icons.star, 'text': 'Satisfaction\nGuarantee'},
      {'icon': Icons.attach_money, 'text': 'Upfront\nPricing'},
      {'icon': Icons.thumb_up, 'text': 'Highly Rated\nProfessionals'},
    ];

    if (screenWidth > 900) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: SizedBox(
          height: featureHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                features.map((feature) {
                  return _featureIcon(
                    context,
                    feature['icon'] as IconData,
                    feature['text'] as String,
                  );
                }).toList(),
          ),
        ),
      );
    } else {
      return Container(
        height: featureHeight,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: features.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: screenWidth > 600 ? 32 : 24),
              child: _featureIcon(
                context,
                features[index]['icon'] as IconData,
                features[index]['text'] as String,
              ),
            );
          },
        ),
      );
    }
  }

  Widget _featureIcon(BuildContext context, IconData icon, String label) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth > 600 ? 56.0 : 48.0;
    final iconSizeInner = screenWidth > 600 ? 24.0 : 20.0;
    final fontSize = screenWidth > 600 ? 12.0 : 10.0;
    final textWidth = screenWidth > 600 ? 80.0 : 60.0;

    return Column(
      children: [
        Container(
          height: iconSize,
          width: iconSize,
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, color: AppColors.textPrimary, size: iconSizeInner),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: textWidth,
          child: Text(
            label,
            style: AppTextStyles.small.copyWith(
              fontSize: fontSize,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }

  Widget _buildWhyChooseUs(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 24.0 : 16.0;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.textPrimary,
                size: screenWidth > 600 ? 24 : 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Why Choose Us',
                style: AppTextStyles.sectionTitle.copyWith(
                  fontSize: screenWidth > 600 ? 18.0 : 16.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child:
              screenWidth > 900
                  ? Row(
                    children: [
                      Expanded(
                        child: _whyChooseCard(
                          context,
                          Icons.verified,
                          'Quality Assurance',
                          'Your satisfaction is guaranteed',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _whyChooseCard(
                          context,
                          Icons.price_check,
                          'Fixed Prices',
                          'No hidden costs, all the prices are known and fixed before booking',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _whyChooseCard(
                          context,
                          Icons.handshake,
                          'Hassel free',
                          'convenient, time saving and secure',
                        ),
                      ),
                    ],
                  )
                  : Column(
                    children: [
                      _whyChooseCard(
                        context,
                        Icons.verified,
                        'Quality Assurance',
                        'Your satisfaction is guaranteed',
                      ),
                      const SizedBox(height: 12),
                      _whyChooseCard(
                        context,
                        Icons.price_check,
                        'Fixed Prices',
                        'No hidden costs, all the prices are known and fixed before booking',
                      ),
                      const SizedBox(height: 12),
                      _whyChooseCard(
                        context,
                        Icons.handshake,
                        'Hassel free',
                        'convenient, time saving and secure',
                      ),
                    ],
                  ),
        ),
      ],
    );
  }

  Widget _whyChooseCard(
    BuildContext context,
    IconData icon,
    String title,
    String desc,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardPadding = screenWidth > 600 ? 20.0 : 16.0;
    final iconSize = screenWidth > 600 ? 24.0 : 20.0;
    final titleFontSize = screenWidth > 600 ? 16.0 : 14.0;
    final descFontSize = screenWidth > 600 ? 14.0 : 12.0;

    return Container(
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth > 600 ? 12 : 8),
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.secondary, size: iconSize),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: AppTextStyles.cardDesc.copyWith(
                    fontSize: descFontSize,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyMeasures(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleFontSize = screenWidth > 600 ? 18.0 : 16.0;
    final containerPadding = screenWidth > 600 ? 24.0 : 20.0;

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Text(
              'Best-in Class Safety Measures',
              style: AppTextStyles.sectionTitle.copyWith(
                color: Colors.white,
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          color: AppColors.background,
          padding: EdgeInsets.all(containerPadding),
          child:
              screenWidth > 900
                  ? Row(
                    children: [
                      Expanded(
                        child: _safetyMeasureCard(
                          context,
                          Icons.masks,
                          'Usage of masks, gloves & Sanitisers',
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisquam enim mauris malesuada eget.',
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: _safetyMeasureCard(
                          context,
                          Icons.social_distance,
                          'Low-contact Service Experience',
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisquam enim mauris malesuada eget.',
                        ),
                      ),
                    ],
                  )
                  : Column(
                    children: [
                      _safetyMeasureCard(
                        context,
                        Icons.masks,
                        'Usage of masks, gloves & Sanitisers',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisquam enim mauris malesuada eget.',
                      ),
                      const SizedBox(height: 20),
                      _safetyMeasureCard(
                        context,
                        Icons.social_distance,
                        'Low-contact Service Experience',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisquam enim mauris malesuada eget.',
                      ),
                    ],
                  ),
        ),
      ],
    );
  }

  Widget _safetyMeasureCard(
    BuildContext context,
    IconData icon,
    String title,
    String desc,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconPadding = screenWidth > 600 ? 16.0 : 12.0;
    final iconSize = screenWidth > 600 ? 28.0 : 24.0;
    final titleFontSize = screenWidth > 600 ? 16.0 : 14.0;
    final descFontSize = screenWidth > 600 ? 14.0 : 12.0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(iconPadding),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, size: iconSize, color: AppColors.textPrimary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.cardTitle.copyWith(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                desc,
                style: AppTextStyles.cardDesc.copyWith(
                  fontSize: descFontSize,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleFontSize = screenWidth > 600 ? 14.0 : 12.0;
    final versionFontSize = screenWidth > 600 ? 12.0 : 11.0;

    return Column(
      children: [
        Text(
          'HASSLE FREE\nQUALITY SERVICE',
          style: AppTextStyles.small.copyWith(
            fontSize: titleFontSize,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'V 1.0',
          style: AppTextStyles.small.copyWith(
            fontSize: versionFontSize,
            color: AppColors.textLight,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.025),
      ],
    );
  }
}
