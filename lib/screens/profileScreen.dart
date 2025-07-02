import 'package:flutter/material.dart';
import 'package:home_service_app/services/appTextStyle.dart';
import 'package:home_service_app/services/appcolors.dart';

class ProfileScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.edit_outlined,
      'title': 'Edit Profile',
      'color': AppColors.textPrimary,
    },
    {
      'icon': Icons.location_on_outlined,
      'title': 'Manage Addresses',
      'color': AppColors.textPrimary,
    },
    {
      'icon': Icons.payment_outlined,
      'title': 'Payment Methods',
      'color': AppColors.textPrimary,
    },
    {
      'icon': Icons.notifications_outlined,
      'title': 'Notifications',
      'color': AppColors.textPrimary,
    },
    {
      'icon': Icons.help_outline,
      'title': 'Help & Support',
      'color': AppColors.textPrimary,
    },
    {
      'icon': Icons.info_outline,
      'title': 'About Us',
      'color': AppColors.textPrimary,
    },
    {'icon': Icons.logout, 'title': 'Logout', 'color': AppColors.error},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth >= 768;
    final isDesktop = screenWidth >= 1024;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child:
            isDesktop
                ? _buildDesktopLayout(screenWidth, screenHeight)
                : _buildMobileLayout(screenWidth, screenHeight, isTablet),
      ),
    );
  }

  Widget _buildDesktopLayout(double screenWidth, double screenHeight) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _buildHeader(screenWidth),
                  _buildProfileCard(screenWidth, screenHeight),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(height: screenWidth < 1200 ? 60 : 80),
                  Expanded(child: _buildMenuList(screenWidth, screenHeight)),
                  _buildFooter(screenWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(
    double screenWidth,
    double screenHeight,
    bool isTablet,
  ) {
    return Column(
      children: [
        _buildHeader(screenWidth),
        _buildProfileCard(screenWidth, screenHeight),
        Expanded(child: _buildMenuList(screenWidth, screenHeight)),
        _buildFooter(screenWidth),
      ],
    );
  }

  Widget _buildHeader(double screenWidth) {
    final padding =
        screenWidth < 600
            ? 16.0
            : screenWidth < 1024
            ? 24.0
            : 32.0;
    final fontSize =
        screenWidth < 600
            ? 20.0
            : screenWidth < 1024
            ? 22.0
            : 24.0;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Profile',
          style: AppTextStyles.heading.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(double screenWidth, double screenHeight) {
    final horizontalMargin =
        screenWidth < 600
            ? 16.0
            : screenWidth < 1024
            ? 24.0
            : 32.0;
    final verticalMargin = screenWidth < 600 ? 8.0 : 12.0;
    final padding =
        screenWidth < 600
            ? 20.0
            : screenWidth < 1024
            ? 24.0
            : 32.0;
    final borderRadius = screenWidth < 600 ? 16.0 : 20.0;
    final avatarRadius =
        screenWidth < 600
            ? 44.0
            : screenWidth < 1024
            ? 50.0
            : 56.0;
    final borderWidth = screenWidth < 600 ? 3.0 : 4.0;
    final cameraIconSize = screenWidth < 600 ? 16.0 : 18.0;
    final cameraContainerPadding = screenWidth < 600 ? 6.0 : 8.0;
    final nameSize =
        screenWidth < 600
            ? 18.0
            : screenWidth < 1024
            ? 20.0
            : 22.0;
    final emailSize = screenWidth < 600 ? 14.0 : 16.0;
    final badgeHorizontalPadding = screenWidth < 600 ? 16.0 : 20.0;
    final badgeVerticalPadding = screenWidth < 600 ? 8.0 : 10.0;
    final badgeSize = screenWidth < 600 ? 12.0 : 13.0;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.border,
                    width: borderWidth,
                  ),
                ),
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: const NetworkImage(
                    'https://randomuser.me/api/portraits/men/32.jpg',
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(cameraContainerPadding),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: cameraIconSize,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth < 600 ? 16 : 20),
          Text(
            'John Doe',
            style: AppTextStyles.heading.copyWith(
              fontSize: nameSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenWidth < 600 ? 4 : 6),
          Text(
            'john.doe@email.com',
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              fontSize: emailSize,
            ),
          ),
          SizedBox(height: screenWidth < 600 ? 12 : 16),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: badgeHorizontalPadding,
              vertical: badgeVerticalPadding,
            ),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Premium Member',
              style: AppTextStyles.small.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.w600,
                fontSize: badgeSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList(double screenWidth, double screenHeight) {
    final horizontalMargin =
        screenWidth < 600
            ? 16.0
            : screenWidth < 1024
            ? 24.0
            : 32.0;
    final verticalMargin = screenWidth < 600 ? 8.0 : 12.0;
    final borderRadius = screenWidth < 600 ? 16.0 : 20.0;
    final listPadding = screenWidth < 600 ? 8.0 : 12.0;
    final horizontalPadding =
        screenWidth < 600
            ? 20.0
            : screenWidth < 1024
            ? 24.0
            : 28.0;
    final verticalPadding = screenWidth < 600 ? 4.0 : 8.0;
    final iconContainerPadding = screenWidth < 600 ? 8.0 : 10.0;
    final iconSize = screenWidth < 600 ? 20.0 : 22.0;
    final titleSize =
        screenWidth < 600
            ? 14.0
            : screenWidth < 1024
            ? 15.0
            : 16.0;
    final trailingIconSize = screenWidth < 600 ? 16.0 : 18.0;
    final dividerIndent = screenWidth < 600 ? 60.0 : 70.0;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: listPadding),
        itemCount: menuItems.length,
        separatorBuilder:
            (context, index) => Divider(
              height: 1,
              color: AppColors.border.withOpacity(0.5),
              indent: dividerIndent,
            ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            leading: Container(
              padding: EdgeInsets.all(iconContainerPadding),
              decoration: BoxDecoration(
                color:
                    item['color'] == AppColors.error
                        ? AppColors.error.withOpacity(0.1)
                        : AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(item['icon'], color: item['color'], size: iconSize),
            ),
            title: Text(
              item['title'],
              style: AppTextStyles.cardTitle.copyWith(
                color: item['color'],
                fontWeight: FontWeight.w500,
                fontSize: titleSize,
              ),
            ),
            trailing:
                item['title'] != 'Logout'
                    ? Icon(
                      Icons.arrow_forward_ios,
                      size: trailingIconSize,
                      color: AppColors.textLight,
                    )
                    : null,
            onTap: () {},
          );
        },
      ),
    );
  }

  Widget _buildFooter(double screenWidth) {
    final padding =
        screenWidth < 600
            ? 16.0
            : screenWidth < 1024
            ? 24.0
            : 32.0;
    final versionSize = screenWidth < 600 ? 12.0 : 13.0;
    final taglineSize = screenWidth < 600 ? 11.0 : 12.0;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          Text(
            'App Version 1.0',
            style: AppTextStyles.small.copyWith(
              color: AppColors.textLight,
              fontSize: versionSize,
            ),
          ),
          SizedBox(height: screenWidth < 600 ? 8 : 10),
          Text(
            'Made with ❤️ for better service',
            style: AppTextStyles.small.copyWith(
              color: AppColors.textLight,
              fontSize: taglineSize,
            ),
          ),
        ],
      ),
    );
  }
}
