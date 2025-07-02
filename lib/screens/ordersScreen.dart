import 'package:flutter/material.dart';
import 'package:home_service_app/services/appTextStyle.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('My Orders', style: AppTextStyles.heading),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: 4,
                itemBuilder:
                    (context, index) => Card(
                      margin: EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: Icon(
                          Icons.cleaning_services,
                          color: Colors.blue,
                          size: 36,
                        ),
                        title: Text(
                          'Order #${1000 + index}',
                          style: AppTextStyles.cardTitle,
                        ),
                        subtitle: Text(
                          'Service: Home Cleaning\nDate: 2024-06-0${index + 1}',
                          style: AppTextStyles.cardDesc,
                        ),
                        trailing: Text(
                          '₹${(index + 1) * 499}',
                          style: AppTextStyles.subheading.copyWith(
                            color: Colors.black,
                          ),
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
