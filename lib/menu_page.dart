import 'package:flutter/material.dart';
import 'package_details_page.dart';
import 'menues.dart';

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
        title: const Text('Menu Packages'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('View Menu Package Details'),

             Expanded(
                child: ListView.builder(
                itemCount: Menues.samples.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => PackageDetailsPage(menu: Menues.samples[index]),
                        ),
                      );
                    },
                    child:
                      buildRecipeCard(Menues.samples[index]),
                  );
                },
              ),
             ),
          ],
        ),
      ),
    );
  }

  Widget buildRecipeCard(Menues menues) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(menues.imgUrl)),
              const SizedBox(
              height: 14.0,
            ),
            Text(
              menues.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ]
        )
      ),
    );
  }
}
