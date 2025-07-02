// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:home_service_app/services/appTextStyle.dart';
import 'package:home_service_app/services/appcolors.dart';

class RewardsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> rewards = [
    {
      'title': 'First Booking Bonus',
      'points': 50,
      'type': 'welcome',
      'icon': Icons.star,
    },
    {
      'title': 'Deep Cleaning Master',
      'points': 75,
      'type': 'achievement',
      'icon': Icons.cleaning_services,
    },
    {
      'title': 'Loyal Customer',
      'points': 100,
      'type': 'loyalty',
      'icon': Icons.favorite,
    },
    {
      'title': 'Review Champion',
      'points': 25,
      'type': 'social',
      'icon': Icons.rate_review,
    },
    {
      'title': 'Weekend Warrior',
      'points': 40,
      'type': 'timing',
      'icon': Icons.weekend,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > 768;
            final isMobile = constraints.maxWidth <= 600;

            return Column(
              children: [
                _buildHeader(context, isTablet, isMobile),
                _buildPointsCard(context, isTablet, isMobile),
                Expanded(child: _buildRewardsList(context, isTablet, isMobile)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isTablet, bool isMobile) {
    final horizontalPadding = isTablet ? 32.0 : (isMobile ? 16.0 : 24.0);
    final iconSize = isTablet ? 28.0 : 24.0;
    final fontSize = isTablet ? 24.0 : (isMobile ? 18.0 : 20.0);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: isTablet ? 1200 : double.infinity),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: isTablet ? 24 : 16,
        ),
        child: Row(
          children: [
            Icon(
              Icons.card_giftcard,
              color: AppColors.textPrimary,
              size: iconSize,
            ),
            SizedBox(width: isTablet ? 16 : 12),
            Text(
              'My Rewards',
              style: AppTextStyles.heading.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsCard(BuildContext context, bool isTablet, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = isTablet ? 32.0 : (isMobile ? 16.0 : 24.0);
    final cardPadding = isTablet ? 24.0 : (isMobile ? 16.0 : 20.0);
    final iconSize = isTablet ? 28.0 : 24.0;
    final titleFontSize = isTablet ? 14.0 : (isMobile ? 11.0 : 12.0);
    final pointsFontSize = isTablet ? 28.0 : (isMobile ? 20.0 : 24.0);
    final buttonFontSize = isTablet ? 14.0 : (isMobile ? 12.0 : 13.0);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: isTablet ? 1200 : double.infinity),
      margin: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isTablet ? 12 : 8,
      ),
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: isTablet ? 16 : 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Flex(
        direction:
            isMobile && screenWidth < 400 ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment:
            isMobile && screenWidth < 400
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(isTablet ? 16 : 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.stars, color: Colors.white, size: iconSize),
          ),
          SizedBox(
            width: isMobile && screenWidth < 400 ? 0 : (isTablet ? 20 : 16),
            height: isMobile && screenWidth < 400 ? 16 : 0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isMobile && screenWidth < 400
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total Points',
                  style: AppTextStyles.small.copyWith(
                    color: Colors.white70,
                    fontSize: titleFontSize,
                  ),
                ),
                SizedBox(height: isTablet ? 6 : 4),
                Text(
                  '290 Points',
                  style: AppTextStyles.heading.copyWith(
                    color: Colors.white,
                    fontSize: pointsFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          if (isMobile && screenWidth < 400) const SizedBox(height: 16),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 16 : 12,
                vertical: isTablet ? 10 : 6,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Redeem',
                style: AppTextStyles.small.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: buttonFontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardsList(BuildContext context, bool isTablet, bool isMobile) {
    final horizontalPadding = isTablet ? 32.0 : (isMobile ? 16.0 : 24.0);
    final screenWidth = MediaQuery.of(context).size.width;

    if (isTablet) {
      return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth > 1200 ? 3 : 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: screenWidth > 1200 ? 2.8 : 2.5,
        ),
        itemCount: rewards.length,
        itemBuilder: (context, index) {
          return _buildRewardCard(rewards[index], isTablet, isMobile, context);
        },
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      itemCount: rewards.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: isTablet ? 16 : 12),
          child: _buildRewardCard(rewards[index], isTablet, isMobile, context),
        );
      },
    );
  }

  Widget _buildRewardCard(
    Map<String, dynamic> reward,
    bool isTablet,
    bool isMobile,
    BuildContext context,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardPadding = isTablet ? 20.0 : (isMobile ? 14.0 : 16.0);
    final iconPadding = isTablet ? 14.0 : 12.0;
    final iconSize = isTablet ? 28.0 : 24.0;
    final titleFontSize = isTablet ? 16.0 : (isMobile ? 14.0 : 15.0);
    final descFontSize = isTablet ? 14.0 : (isMobile ? 12.0 : 13.0);
    final pointsFontSize = isTablet ? 13.0 : (isMobile ? 11.0 : 12.0);

    return Container(
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: isTablet ? 12 : 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Flex(
        direction:
            isMobile && screenWidth < 350 ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment:
            isMobile && screenWidth < 350
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(iconPadding),
            decoration: BoxDecoration(
              color: _getRewardColor(reward['type']).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              reward['icon'],
              color: _getRewardColor(reward['type']),
              size: iconSize,
            ),
          ),
          SizedBox(
            width: isMobile && screenWidth < 350 ? 0 : (isTablet ? 20 : 16),
            height: isMobile && screenWidth < 350 ? 12 : 0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  reward['title'],
                  style: AppTextStyles.cardTitle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: titleFontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: isTablet ? 2 : 1,
                ),
                SizedBox(height: isTablet ? 6 : 4),
                Text(
                  _getRewardDescription(reward['type']),
                  style: AppTextStyles.cardDesc.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: descFontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: isTablet ? 3 : 2,
                ),
              ],
            ),
          ),
          if (isMobile && screenWidth < 350) const SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 16 : 12,
              vertical: isTablet ? 8 : 6,
            ),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '+${reward['points']} pts',
              style: AppTextStyles.small.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.w600,
                fontSize: pointsFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getRewardColor(String type) {
    switch (type) {
      case 'welcome':
        return Colors.purple;
      case 'achievement':
        return Colors.blue;
      case 'loyalty':
        return Colors.red;
      case 'social':
        return Colors.orange;
      case 'timing':
        return Colors.teal;
      default:
        return AppColors.primary;
    }
  }

  String _getRewardDescription(String type) {
    switch (type) {
      case 'welcome':
        return 'Welcome bonus for joining us';
      case 'achievement':
        return 'Completed multiple cleaning services';
      case 'loyalty':
        return 'Regular customer appreciation';
      case 'social':
        return 'Shared feedback and reviews';
      case 'timing':
        return 'Booked services on weekends';
      default:
        return 'Great job earning this reward!';
    }
  }
}
