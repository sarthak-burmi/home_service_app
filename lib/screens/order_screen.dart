import 'package:flutter/material.dart';
import 'package:home_service_app/services/appTextStyle.dart';

class RewardsScreen extends StatelessWidget {
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
              child: Text('Rewards', style: AppTextStyles.heading),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: 5,
                itemBuilder:
                    (context, index) => Card(
                      margin: EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: Icon(
                          Icons.card_giftcard,
                          color: Colors.amber,
                          size: 36,
                        ),
                        title: Text(
                          'Reward #${index + 1}',
                          style: AppTextStyles.cardTitle,
                        ),
                        subtitle: Text(
                          'You earned this reward for booking a service!',
                          style: AppTextStyles.cardDesc,
                        ),
                        trailing: Text(
                          '+${(index + 1) * 10} pts',
                          style: AppTextStyles.subheading.copyWith(
                            color: Colors.green,
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
