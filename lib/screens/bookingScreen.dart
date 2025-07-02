import 'package:flutter/material.dart';
import 'package:home_service_app/services/appTextStyle.dart';
import 'package:home_service_app/services/appcolors.dart';

class BookingsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> bookings = [
    {
      'id': '2024001',
      'service': 'Kitchen Cleaning',
      'date': '2024-07-15',
      'time': '10:00 AM',
      'status': 'Confirmed',
      'price': 299,
      'provider': 'CleanPro Services',
    },
    {
      'id': '2024002',
      'service': 'Full Home Cleaning',
      'date': '2024-07-20',
      'time': '2:00 PM',
      'status': 'Pending',
      'price': 599,
      'provider': 'HomeShine Ltd',
    },
    {
      'id': '2024003',
      'service': 'Sofa Cleaning',
      'date': '2024-07-25',
      'time': '11:30 AM',
      'status': 'Completed',
      'price': 199,
      'provider': 'SparkleClean Co',
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
                _buildFilterTabs(context, isTablet, isMobile),
                Expanded(
                  child: _buildBookingsList(context, isTablet, isMobile),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isTablet, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
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
        child: Flex(
          direction:
              isMobile && screenWidth < 400 ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment:
              isMobile && screenWidth < 400
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.book_online,
                  color: AppColors.textPrimary,
                  size: iconSize,
                ),
                SizedBox(width: isTablet ? 16 : 12),
                Text(
                  'My Bookings',
                  style: AppTextStyles.heading.copyWith(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            if (!(isMobile && screenWidth < 400)) const Spacer(),
            if (isMobile && screenWidth < 400) const SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 16 : 12,
                vertical: isTablet ? 8 : 6,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${bookings.length} Active',
                style: AppTextStyles.small.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: isTablet ? 14 : 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs(BuildContext context, bool isTablet, bool isMobile) {
    final horizontalPadding = isTablet ? 32.0 : (isMobile ? 16.0 : 24.0);
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: isTablet ? 1200 : double.infinity),
      margin: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isTablet ? 12 : 8,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterTab('All', true, isTablet, isMobile),
            SizedBox(width: isTablet ? 12 : 8),
            _buildFilterTab('Confirmed', false, isTablet, isMobile),
            SizedBox(width: isTablet ? 12 : 8),
            _buildFilterTab('Pending', false, isTablet, isMobile),
            SizedBox(width: isTablet ? 12 : 8),
            _buildFilterTab('Completed', false, isTablet, isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTab(
    String title,
    bool isSelected,
    bool isTablet,
    bool isMobile,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 20 : 16,
        vertical: isTablet ? 12 : 8,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.border,
        ),
      ),
      child: Text(
        title,
        style: AppTextStyles.small.copyWith(
          color: isSelected ? Colors.white : AppColors.textSecondary,
          fontWeight: FontWeight.w500,
          fontSize: isTablet ? 14 : (isMobile ? 12 : 13),
        ),
      ),
    );
  }

  Widget _buildBookingsList(
    BuildContext context,
    bool isTablet,
    bool isMobile,
  ) {
    final horizontalPadding = isTablet ? 32.0 : (isMobile ? 16.0 : 24.0);
    final screenWidth = MediaQuery.of(context).size.width;

    if (isTablet) {
      return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth > 1200 ? 3 : 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          return _buildBookingCard(
            bookings[index],
            isTablet,
            isMobile,
            context,
          );
        },
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: isTablet ? 20 : 16),
          child: _buildBookingCard(
            bookings[index],
            isTablet,
            isMobile,
            context,
          ),
        );
      },
    );
  }

  Widget _buildBookingCard(
    Map<String, dynamic> booking,
    bool isTablet,
    bool isMobile,
    BuildContext context,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardPadding = isTablet ? 20.0 : (isMobile ? 16.0 : 18.0);

    return Container(
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(isTablet ? 20 : 16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: isTablet ? 12 : 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flex(
            direction:
                isMobile && screenWidth < 400 ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment:
                isMobile && screenWidth < 400
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(isTablet ? 12 : 10),
                    decoration: BoxDecoration(
                      color: _getStatusColor(
                        booking['status'],
                      ).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(isTablet ? 12 : 10),
                    ),
                    child: Icon(
                      _getStatusIcon(booking['status']),
                      color: _getStatusColor(booking['status']),
                      size: isTablet ? 24 : 20,
                    ),
                  ),
                  SizedBox(width: isTablet ? 16 : 12),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          booking['service'],
                          style: AppTextStyles.cardTitle.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: isTablet ? 18 : (isMobile ? 14 : 16),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'ID: ${booking['id']}',
                          style: AppTextStyles.small.copyWith(
                            color: AppColors.textLight,
                            fontSize: isTablet ? 13 : (isMobile ? 11 : 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (!(isMobile && screenWidth < 400)) const Spacer(),
              if (isMobile && screenWidth < 400) const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 12 : 8,
                  vertical: isTablet ? 6 : 4,
                ),
                decoration: BoxDecoration(
                  color: _getStatusColor(booking['status']).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  booking['status'],
                  style: AppTextStyles.small.copyWith(
                    color: _getStatusColor(booking['status']),
                    fontWeight: FontWeight.w500,
                    fontSize: isTablet ? 13 : 11,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isTablet ? 16 : 12),
          Container(
            padding: EdgeInsets.all(isTablet ? 16 : 12),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(isTablet ? 12 : 8),
            ),
            child: Column(
              children: [
                Flex(
                  direction:
                      isMobile && screenWidth < 350
                          ? Axis.vertical
                          : Axis.horizontal,
                  crossAxisAlignment:
                      isMobile && screenWidth < 350
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: isTablet ? 18 : 16,
                          color: AppColors.iconGrey,
                        ),
                        SizedBox(width: isTablet ? 10 : 8),
                        Text(
                          booking['date'],
                          style: AppTextStyles.cardDesc.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: isTablet ? 14 : (isMobile ? 12 : 13),
                          ),
                        ),
                      ],
                    ),
                    if (!(isMobile && screenWidth < 350)) const Spacer(),
                    if (isMobile && screenWidth < 350)
                      const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time,
                          size: isTablet ? 18 : 16,
                          color: AppColors.iconGrey,
                        ),
                        SizedBox(width: isTablet ? 10 : 8),
                        Text(
                          booking['time'],
                          style: AppTextStyles.cardDesc.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: isTablet ? 14 : (isMobile ? 12 : 13),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: isTablet ? 12 : 8),
                Row(
                  children: [
                    Icon(
                      Icons.business,
                      size: isTablet ? 18 : 16,
                      color: AppColors.iconGrey,
                    ),
                    SizedBox(width: isTablet ? 10 : 8),
                    Expanded(
                      child: Text(
                        booking['provider'],
                        style: AppTextStyles.cardDesc.copyWith(
                          fontSize: isTablet ? 14 : (isMobile ? 12 : 13),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '₹${booking['price']}',
                      style: AppTextStyles.cardTitle.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w600,
                        fontSize: isTablet ? 16 : (isMobile ? 14 : 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: isTablet ? 16 : 12),
          Flex(
            direction:
                isMobile && screenWidth < 300 ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: isTablet ? 14 : 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(isTablet ? 12 : 8),
                  ),
                  child: Center(
                    child: Text(
                      'View Details',
                      style: AppTextStyles.small.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: isTablet ? 14 : (isMobile ? 12 : 13),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: isMobile && screenWidth < 300 ? 0 : (isTablet ? 12 : 8),
                height: isMobile && screenWidth < 300 ? 8 : 0,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: isTablet ? 14 : 10),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(isTablet ? 12 : 8),
                  ),
                  child: Center(
                    child: Text(
                      _getActionText(booking['status']),
                      style: AppTextStyles.small.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: isTablet ? 14 : (isMobile ? 12 : 13),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return AppColors.success;
      case 'pending':
        return AppColors.warning;
      case 'completed':
        return Colors.blue;
      default:
        return AppColors.textSecondary;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Icons.check_circle;
      case 'pending':
        return Icons.schedule;
      case 'completed':
        return Icons.task_alt;
      default:
        return Icons.event;
    }
  }

  String _getActionText(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return 'Reschedule';
      case 'pending':
        return 'Cancel';
      case 'completed':
        return 'Book Again';
      default:
        return 'Manage';
    }
  }
}
