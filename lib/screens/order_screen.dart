import 'package:flutter/material.dart';
import 'package:home_service_app/services/appTextStyle.dart';
import 'package:home_service_app/services/appcolors.dart';

class OrdersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      'id': 'ORD001',
      'service': 'Kitchen Cleaning',
      'date': '2 days ago',
      'status': 'completed',
      'amount': 1200,
    },
    {
      'id': 'ORD002',
      'service': 'Sofa Cleaning',
      'date': '1 week ago',
      'status': 'completed',
      'amount': 800,
    },
    {
      'id': 'ORD003',
      'service': 'Full Home Cleaning',
      'date': '2 weeks ago',
      'status': 'completed',
      'amount': 2500,
    },
    {
      'id': 'ORD004',
      'service': 'Bathroom Cleaning',
      'date': '3 weeks ago',
      'status': 'cancelled',
      'amount': 600,
    },
    {
      'id': 'ORD005',
      'service': 'Carpet Cleaning',
      'date': '1 month ago',
      'status': 'completed',
      'amount': 1000,
    },
  ];

  OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 768;
    final isDesktop = screenWidth >= 1024;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(screenWidth),
            _buildOrderStats(screenWidth, isTablet, isDesktop),
            Expanded(child: _buildOrdersList(screenWidth, isTablet, isDesktop)),
          ],
        ),
      ),
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
    final iconSize =
        screenWidth < 600
            ? 24.0
            : screenWidth < 1024
            ? 26.0
            : 28.0;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        children: [
          Icon(Icons.list_alt, color: AppColors.textPrimary, size: iconSize),
          SizedBox(width: screenWidth < 600 ? 12 : 16),
          Text(
            'My Orders',
            style: AppTextStyles.heading.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderStats(double screenWidth, bool isTablet, bool isDesktop) {
   
    final totalOrders = orders.length;
    final completedOrders =
        orders.where((order) => order['status'] == 'completed').length;
    final cancelledOrders =
        orders.where((order) => order['status'] == 'cancelled').length;
    final pendingOrders =
        orders.where((order) => order['status'] == 'pending').length;

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
            : 28.0;
    final borderRadius = screenWidth < 600 ? 16.0 : 20.0;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      padding: EdgeInsets.all(padding),
      constraints: isDesktop ? const BoxConstraints(maxWidth: 1200) : null,
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
      child:
          isTablet
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatItem(
                    'Total Orders',
                    totalOrders.toString(),
                    Icons.shopping_bag,
                    screenWidth,
                  ),
                  _buildStatDivider(),
                  _buildStatItem(
                    'Completed',
                    completedOrders.toString(),
                    Icons.check_circle,
                    screenWidth,
                  ),
                  _buildStatDivider(),
                  _buildStatItem(
                    'Cancelled',
                    cancelledOrders.toString(),
                    Icons.cancel,
                    screenWidth,
                  ),
                  if (pendingOrders > 0) ...[
                    _buildStatDivider(),
                    _buildStatItem(
                      'Pending',
                      pendingOrders.toString(),
                      Icons.schedule,
                      screenWidth,
                    ),
                  ],
                ],
              )
              : Column(
                children: [
                  Row(
                    children: [
                      _buildStatItem(
                        'Total Orders',
                        totalOrders.toString(),
                        Icons.shopping_bag,
                        screenWidth,
                      ),
                      _buildStatDivider(),
                      _buildStatItem(
                        'Completed',
                        completedOrders.toString(),
                        Icons.check_circle,
                        screenWidth,
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth < 400 ? 16 : 20),
                  Row(
                    children: [
                      _buildStatItem(
                        'Cancelled',
                        cancelledOrders.toString(),
                        Icons.cancel,
                        screenWidth,
                      ),
                      if (pendingOrders > 0) ...[
                        _buildStatDivider(),
                        _buildStatItem(
                          'Pending',
                          pendingOrders.toString(),
                          Icons.schedule,
                          screenWidth,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    double screenWidth,
  ) {
    final iconSize =
        screenWidth < 600
            ? 20.0
            : screenWidth < 1024
            ? 22.0
            : 24.0;
    final valueSize =
        screenWidth < 600
            ? 18.0
            : screenWidth < 1024
            ? 20.0
            : 22.0;
    final labelSize =
        screenWidth < 600
            ? 11.0
            : screenWidth < 1024
            ? 12.0
            : 13.0;

    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: AppColors.textSecondary, size: iconSize),
          SizedBox(height: screenWidth < 600 ? 8 : 10),
          Text(
            value,
            style: AppTextStyles.heading.copyWith(
              fontSize: valueSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenWidth < 600 ? 4 : 6),
          Text(
            label,
            style: AppTextStyles.small.copyWith(
              color: AppColors.textSecondary,
              fontSize: labelSize,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStatDivider() {
    return Container(
      height: 40,
      width: 1,
      color: AppColors.border,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Widget _buildOrdersList(double screenWidth, bool isTablet, bool isDesktop) {
    final horizontalPadding =
        screenWidth < 600
            ? 16.0
            : screenWidth < 1024
            ? 24.0
            : 32.0;

    if (orders.isEmpty) {
      return _buildEmptyState(screenWidth);
    }

    final crossAxisCount = isDesktop ? 2 : 1;
    final childAspectRatio =
        isDesktop
            ? 3.5
            : isTablet
            ? 4.0
            : 2.8;

    if (isDesktop) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: 16,
            mainAxisSpacing: 12,
          ),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return _buildOrderCard(order, screenWidth);
          },
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Container(
          margin: EdgeInsets.only(bottom: screenWidth < 600 ? 12 : 16),
          child: _buildOrderCard(order, screenWidth),
        );
      },
    );
  }

  Widget _buildEmptyState(double screenWidth) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: screenWidth < 600 ? 64 : 80,
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
          SizedBox(height: screenWidth < 600 ? 16 : 24),
          Text(
            'No Orders Found',
            style: AppTextStyles.heading.copyWith(
              fontSize: screenWidth < 600 ? 18 : 20,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: screenWidth < 600 ? 8 : 12),
          Text(
            'You haven\'t placed any orders yet.',
            style: AppTextStyles.small.copyWith(
              color: AppColors.textSecondary.withOpacity(0.7),
              fontSize: screenWidth < 600 ? 12 : 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order, double screenWidth) {
    final padding =
        screenWidth < 600
            ? 16.0
            : screenWidth < 1024
            ? 20.0
            : 24.0;
    final borderRadius = screenWidth < 600 ? 12.0 : 16.0;
    final iconPadding = screenWidth < 600 ? 12.0 : 16.0;
    final iconSize = screenWidth < 600 ? 20.0 : 24.0;
    final titleSize =
        screenWidth < 600
            ? 14.0
            : screenWidth < 1024
            ? 15.0
            : 16.0;
    final subtitleSize = screenWidth < 600 ? 11.0 : 12.0;
    final statusSize = screenWidth < 600 ? 10.0 : 11.0;
    final amountSize =
        screenWidth < 600
            ? 14.0
            : screenWidth < 1024
            ? 15.0
            : 16.0;

    return Container(
      padding: EdgeInsets.all(padding),
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
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(iconPadding),
                decoration: BoxDecoration(
                  color: _getServiceColor(order['service']).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getServiceIcon(order['service']),
                  color: _getServiceColor(order['service']),
                  size: iconSize,
                ),
              ),
              SizedBox(width: screenWidth < 600 ? 12 : 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order['service'],
                      style: AppTextStyles.cardTitle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: titleSize,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenWidth < 600 ? 4 : 6),
                    Text(
                      'Order ID: ${order['id']}',
                      style: AppTextStyles.small.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: subtitleSize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth < 600 ? 8 : 10,
                  vertical: screenWidth < 600 ? 4 : 6,
                ),
                decoration: BoxDecoration(
                  color: _getStatusColor(order['status']).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  order['status'].toUpperCase(),
                  style: AppTextStyles.small.copyWith(
                    color: _getStatusColor(order['status']),
                    fontSize: statusSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth < 600 ? 12 : 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order['date'],
                style: AppTextStyles.small.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: subtitleSize,
                ),
              ),
              Text(
                '₹${order['amount']}',
                style: AppTextStyles.cardTitle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  fontSize: amountSize,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getServiceColor(String service) {
    if (service.contains('Kitchen')) return Colors.orange;
    if (service.contains('Sofa')) return Colors.purple;
    if (service.contains('Full Home')) return Colors.blue;
    if (service.contains('Bathroom')) return Colors.teal;
    if (service.contains('Carpet')) return Colors.green;
    return AppColors.primary;
  }

  IconData _getServiceIcon(String service) {
    if (service.contains('Kitchen')) return Icons.kitchen;
    if (service.contains('Sofa')) return Icons.chair;
    if (service.contains('Full Home')) return Icons.home;
    if (service.contains('Bathroom')) return Icons.bathtub;
    if (service.contains('Carpet')) return Icons.layers;
    return Icons.cleaning_services;
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'completed':
        return AppColors.success;
      case 'cancelled':
        return AppColors.error;
      case 'pending':
        return AppColors.warning;
      default:
        return AppColors.textSecondary;
    }
  }
}
