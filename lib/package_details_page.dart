import 'package:flutter/material.dart';
import 'package:wedding/menues.dart';
import 'total_payment_page.dart';

class PackageDetailsPage extends StatefulWidget {
  final Menues menu;
  final String userName;
  final String address;
  final String phone;
  final String email;
  final String bookingDate;
  final String eventDate;
  final String additionalRequests;

  const PackageDetailsPage({Key? key,
    required this.menu,
    required this.userName,
    required this.address,
    required this.phone,
    required this.email,
    required this.bookingDate,
    required this.eventDate,
    required this.additionalRequests,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PackageDetailsPageState createState() {
    return _PackageDetailsPageState();
  }
}

class _PackageDetailsPageState extends State<PackageDetailsPage> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Package Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
                child: Column(children: <Widget>[
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(image: AssetImage(widget.menu.imgUrl)),
              ),
              const SizedBox(
                height: 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.menu.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Type of Menu: ${widget.menu.typeOfMenu}",
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Rate per Menu: ${widget.menu.ratePerMenu}€",
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 10),
                  const Divider(height: 1, color: Colors.grey),
                  const SizedBox(height: 10),
                  Text(
                    widget.menu.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              )
            ])),
            const SizedBox(height: 10),
            Slider(
              min: 1,
              max: 500,
              divisions: 10,
              label: '${_sliderVal * widget.menu.servings} servings',
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              activeColor: const Color.fromARGB(255, 106, 76, 175),
              inactiveColor: Colors.black,
            ),
            const SizedBox(height: 40),
            Container(
              height: 55,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(colors: [
                  Colors.purple,
                  Colors.blue,
                ]),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TotalPaymentPage(
                        totalPayment: (_sliderVal * widget.menu.ratePerMenu).toDouble(),
                        userName: widget.userName,
                        address: widget.address,
                        phone: widget.phone,
                        email: widget.email,
                        bookingDate: widget.bookingDate,
                        eventDate: widget.eventDate,
                        additionalRequests: widget.additionalRequests,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .transparent, // Set to transparent to use the decoration gradient
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
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
