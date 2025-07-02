import 'package:flutter/material.dart';
import 'package:home_service_app/services/appTextStyle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // AppBar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Icon(Icons.location_city, color: Colors.black),
                    SizedBox(width: 8),
                    Text(
                      'Home',
                      style: AppTextStyles.heading.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.notifications_none, color: Colors.black),
                  ],
                ),
              ),
              // Location
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey[700], size: 18),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Inner Circle, Connaught Place, New Delhi...',
                        style: AppTextStyles.small,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.grey[700]),
                  ],
                ),
              ),
              SizedBox(height: 12),
              // Banner
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
                    ), // Placeholder
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Home Cleaning',
                        style: AppTextStyles.heading.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              // Service Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _serviceIcon('Renovation', Icons.home_repair_service),
                    _serviceIcon('Handyman', Icons.handyman),
                    _serviceIcon('Home Cleaning', Icons.cleaning_services),
                    _serviceIcon('Gardening', Icons.grass),
                    _serviceIcon('Declutter', Icons.delete_outline),
                    _serviceIcon('Painting', Icons.format_paint),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Popular Services
              _sectionTitle('Popular Services'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _popularServiceCard(
                      'Kitchen Cleaning',
                      'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
                    ),
                    SizedBox(width: 8),
                    _popularServiceCard('Sofa Cleaning', null),
                    SizedBox(width: 8),
                    _popularServiceCard(
                      'Full Home',
                      'https://images.unsplash.com/photo-1464983953574-0892a716854b',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Cleaning Services
              _sectionTitle('Cleaning Services'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _cleaningServiceCard(
                      'Kitchen Cleaning',
                      'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
                    ),
                    SizedBox(width: 8),
                    _cleaningServiceCard(
                      'Sofa Cleaning',
                      'https://images.unsplash.com/photo-1464983953574-0892a716854b',
                    ),
                    SizedBox(width: 8),
                    _cleaningServiceCard(
                      'Full Home',
                      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              // Features Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _featureIcon(Icons.verified, 'On Demand\nScreened'),
                      _featureIcon(Icons.verified_user, 'Verified\nPartners'),
                      _featureIcon(Icons.verified, 'Satisfaction\nGuarantee'),
                      _featureIcon(Icons.attach_money, 'Upfront\nPricing'),
                      _featureIcon(Icons.star, 'Highly Rated\nProfessionals'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Why Choose Us
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Why Choose Us', style: AppTextStyles.sectionTitle),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _whyChooseCard(
                      Icons.verified,
                      'Quality Assurance',
                      'Your satisfaction is guaranteed',
                    ),
                    SizedBox(height: 8),
                    _whyChooseCard(
                      Icons.price_check,
                      'Fixed Prices',
                      'No hidden costs, all the prices are known and fixed before booking',
                    ),
                    SizedBox(height: 8),
                    _whyChooseCard(
                      Icons.handshake,
                      'Hassel free',
                      'convenient, time saving and secure',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Safety Measures
              Container(
                width: double.infinity,
                color: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Text(
                    'Best-in Class Safety Measures',
                    style: AppTextStyles.sectionTitle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                color: Color(0xFFF7F7F7),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.masks, size: 40, color: Colors.black),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Usage of masks, gloves & Sanitisers',
                                style: AppTextStyles.cardTitle,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisquam enim mauris malesuada eget. Etiam in condimentum porttitor nec tristique dapibus ipsum nunc.',
                                style: AppTextStyles.cardDesc,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.social_distance,
                          size: 40,
                          color: Colors.black,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Low-contact Service Experience',
                                style: AppTextStyles.cardTitle,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisquam enim mauris malesuada eget. Etiam in condimentum porttitor nec tristique dapibus ipsum nunc.',
                                style: AppTextStyles.cardDesc,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Footer
              Column(
                children: [
                  Text(
                    'HASSLE FREE\nQUALITY SERVICE',
                    style: AppTextStyles.small,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text('V 1.0', style: AppTextStyles.small),
                  SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
    );
  }

  Widget _serviceIcon(String label, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 22,
          child: Icon(icon, color: Colors.black, size: 22),
        ),
        SizedBox(height: 4),
        Text(label, style: AppTextStyles.small, textAlign: TextAlign.center),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: AppTextStyles.sectionTitle),
      ),
    );
  }

  Widget _popularServiceCard(String title, String? imageUrl) {
    return Expanded(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image:
              imageUrl != null
                  ? DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  )
                  : null,
        ),
        child:
            imageUrl == null
                ? Center(
                  child: Icon(Icons.image, color: Colors.grey[400], size: 32),
                )
                : null,
      ),
    );
  }

  Widget _cleaningServiceCard(String title, String imageUrl) {
    return Expanded(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _featureIcon(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 18,
            child: Icon(icon, color: Colors.black, size: 18),
          ),
          SizedBox(height: 4),
          Text(label, style: AppTextStyles.small, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _whyChooseCard(IconData icon, String title, String desc) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.red, size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.cardTitle),
                SizedBox(height: 2),
                Text(desc, style: AppTextStyles.cardDesc),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
