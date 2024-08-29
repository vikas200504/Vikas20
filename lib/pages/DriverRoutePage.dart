import 'package:flutter/material.dart';
import 'bookedPage.dart'; // Import the BookedPage

class DriverRoutePage extends StatefulWidget {
  @override
  _DriverRoutePageState createState() => _DriverRoutePageState();
}

class _DriverRoutePageState extends State<DriverRoutePage> {
  String? selectedSeats;
  String? selectedPassengers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Route'),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Pickup Location TextField
            TextField(
              decoration: InputDecoration(
                hintText: 'Pickup Location',
                border: OutlineInputBorder(),
              ),
            ),

            // Pointer Container
            Container(
              height: 40, // Adjust height as needed for visual clarity
              child: Center(
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.grey,
                  size: 24,
                ),
              ),
            ),

            // Drop Location TextField
            Container(
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Drop Location',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // SizedBox between Drop Location and Seats
            SizedBox(height: 30),

            // Dropdown for Seats in the Car
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: 'Seats in the Car',
                border: OutlineInputBorder(),
              ),
              value: selectedSeats,
              items: ['4', '6', '8'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedSeats = newValue;
                });
              },
            ),

            // SizedBox between Seats and Passengers
            SizedBox(height: 10),

            // Dropdown for Number of Passengers
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: 'Number of Passengers',
                border: OutlineInputBorder(),
              ),
              value: selectedPassengers,
              items: ['1', '2', '3', '4', '5', '6', '7'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedPassengers = newValue;
                });
              },
            ),

            Spacer(),

            // 'BOOK ONE' Button with full width and custom color
            SizedBox(
              width: double.infinity, // Cover the entire width of the row
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookedPage()),
                  );
                },
                child: Text(
                  'BOOK ONE',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 40, 58, 58), // Color RGB(40, 58, 58)
                  padding: EdgeInsets.symmetric(
                      vertical: 16), // Adjust vertical padding
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
