import 'package:flutter/material.dart';
import 'bookedPage.dart'; // Import the BookedPage

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
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
