import 'package:flutter/material.dart';
import 'package:wedding/menues.dart';
import 'total_payment_page.dart';

class PackageDetailsPage extends StatefulWidget {
  final Menues menu;

  const PackageDetailsPage({Key? key, required this.menu}) :
  super(key: key);

  @override
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
        title: Text('Package Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image(image:
                    AssetImage(widget.menu.imgUrl)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.menu.title,
                    style: const
                    TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Type of Menu: ${widget.menu.typeOfMenu}",
                    style: const
                    TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Rate per Menu: ${widget.menu.ratePerMenu}€",
                    style: const
                    TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.menu.description,
                    style: const
                    TextStyle(fontSize: 16),
                  ),
                ]
              )
            ),
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
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TotalPaymentPage(totalPayment: (_sliderVal * widget.menu.ratePerMenu).toDouble()),
                  ),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
