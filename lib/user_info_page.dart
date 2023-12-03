import 'package:flutter/material.dart';
import 'menu_page.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  DateTime bookingDateController = DateTime.now();
  DateTime eventDateController = DateTime.now();
  TextEditingController additionalRequestsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bookingHours = bookingDateController.hour.toString().padLeft(2, '0');
    final bookingMinutes =
        bookingDateController.minute.toString().padLeft(2, '0');

    final eventHours = eventDateController.hour.toString().padLeft(2, '0');
    final eventMinutes = eventDateController.minute.toString().padLeft(2, '0');

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Enter your details',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 200,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    TextFormField(
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'Address',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'Phone Number',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                    ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Booking date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                              child: Text(
                                  '${bookingDateController.day}/${bookingDateController.month}/${bookingDateController.year}'),
                              onPressed: () async {
                                final date =
                                    await pickDate(bookingDateController);
                                if (date == null) return;

                                final newDateTime = DateTime(
                                  date.day,
                                  date.month,
                                  date.year,
                                  bookingDateController.hour,
                                  bookingDateController.minute,
                                );
                                setState(
                                    () => bookingDateController = newDateTime);
                              },
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                child: Text('$bookingHours:$bookingMinutes'),
                                onPressed: () async {
                                  final time =
                                      await pickTime(bookingDateController);
                                  if (time == null) return;

                                  final newDateTime = DateTime(
                                    bookingDateController.day,
                                    bookingDateController.month,
                                    bookingDateController.year,
                                    time.hour,
                                    time.minute,
                                  );
                                  setState(
                                      () =>
                                          bookingDateController = newDateTime);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Event date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 33,
                            ),
                            ElevatedButton(
                              child: Text(
                                  '${eventDateController.day}/${eventDateController.month}/${eventDateController.year}'),
                              onPressed: () async {
                                final date =
                                    await pickDate(eventDateController);
                                if (date == null) return;

                                final newDateTime = DateTime(
                                  date.day,
                                  date.month,
                                  date.year,
                                  eventDateController.hour,
                                  eventDateController.minute,
                                );
                                setState(
                                    () => eventDateController = newDateTime);
                              },
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                child: Text('$eventHours:$eventMinutes'),
                                onPressed: () async {
                                  final time =
                                      await pickTime(eventDateController);
                                  if (time == null) return;

                                  final newDateTime = DateTime(
                                    eventDateController.day,
                                    eventDateController.month,
                                    eventDateController.year,
                                    time.hour,
                                    time.minute,
                                  );
                                  setState(
                                      () =>
                                          eventDateController = newDateTime);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 55,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(colors: [
                              Colors.purple,
                              Colors.blue,
                            ]),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MenuPage(
                                      userName: nameController.text,
                                      address: addressController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      bookingDate:
                                          bookingDateController.toString(),
                                      eventDate:
                                          eventDateController.toString(),
                                      additionalRequests:
                                          additionalRequestsController.text,
                                    ),
                                  ),
                                );
                              }
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
                ),
              ),
            ),
          ),
          Positioned(
            top: 60.0,
            right: 22.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Go back to the previous page
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> pickDate(DateTime initialDate) => showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickTime(DateTime initialTime) => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: initialTime.hour, minute: initialTime.minute),
      );
}
