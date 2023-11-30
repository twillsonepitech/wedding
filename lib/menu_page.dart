import 'package:flutter/material.dart';
import 'package_details_page.dart';

class MenuPage extends StatelessWidget {
  final String userName;
  final String address;
  final String phone;
  final String email;
  final String bookingDate;
  final String eventDate;
  final String additionalRequests;

  MenuPage({
    required this.userName,
    required this.address,
    required this.phone,
    required this.email,
    required this.bookingDate,
    required this.eventDate,
    required this.additionalRequests,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Packages'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('View Menu Package Details'),

            // Add UI elements for displaying menu package details and images

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PackageDetailsPage(),
                  ),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
