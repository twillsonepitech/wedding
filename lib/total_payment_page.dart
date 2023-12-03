import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TotalPaymentPage extends StatefulWidget {
  final double totalPayment;

  const TotalPaymentPage({Key? key, required this.totalPayment}) :
  super(key: key);

  @override
  _TotalPaymentPageState createState() => _TotalPaymentPageState();
}

class _TotalPaymentPageState extends State<TotalPaymentPage> {
  String discountCode = '';
  double totalPayment = 0.0;
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    totalPayment = widget.totalPayment;
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Discount Code'),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  discountCode = value;
                  // Implement logic to validate and apply discount
                  // For simplicity, we assume a fixed discount amount here
                  if (discountCode == 'DISCOUNT123') {
                    totalPayment -= 100.0;
                  }
                });
              },
              decoration: InputDecoration(labelText: 'Discount Code'),
            ),

            SizedBox(height: 20),

            Text('Calculate Total Payment'),
            Text("Total payement is : $totalPayment €"),

            // Add UI elements for calculating total payment based on the number of guests

            SizedBox(height: 20),

            Text('Display Total Payment'),

            // Add UI elements for displaying the total payment

            SizedBox(height: 20),

            Text('Allow Users to Give Ratings'),
            RatingBar(
              initialRating: rating,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: Icon(Icons.star, color: Colors.amber),
                half: Icon(Icons.star_half, color: Colors.amber),
                empty: Icon(Icons.star_border, color: Colors.amber),
              ),
              onRatingUpdate: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Add logic for submitting the booking and ratings
              },
              child: Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
