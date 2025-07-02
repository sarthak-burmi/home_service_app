import 'package:flutter/material.dart';
import 'package:home_service_app/services/appTextStyle.dart';

class BookingsScreen extends StatelessWidget {
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
              child: Text('Bookings', style: AppTextStyles.heading),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: 3,
                itemBuilder:
                    (context, index) => Card(
                      margin: EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: Icon(
                          Icons.event_available,
                          color: Colors.deepPurple,
                          size: 36,
                        ),
                        title: Text(
                          'Booking #${2000 + index}',
                          style: AppTextStyles.cardTitle,
                        ),
                        subtitle: Text(
                          'Status: Confirmed\nDate: 2024-06-1${index + 1}',
                          style: AppTextStyles.cardDesc,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.grey,
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
