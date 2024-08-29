import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // For loading animation
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Required by flutter_map
import 'home_page.dart'; // Import the HomePage

class BookedPage extends StatelessWidget {
  final MapController _mapController = MapController();
  final String? pickupLocation;
  final String? dropLocation;
  final List<Marker> _markers = [
    Marker(
      point: LatLng(51.5, -0.09),
      width: 80,
      height: 80,
      child: Icon(Icons.location_pin, color: Colors.red, size: 40),
    ),
    Marker(
      point: LatLng(51.515, -0.1),
      width: 80,
      height: 80,
      child: Icon(Icons.location_pin, color: Colors.blue, size: 40),
    ),
  ];

  // Example polyline path
  final List<LatLng> _polylinePoints = [
    LatLng(51.5, -0.09),
    LatLng(51.515, -0.1),
    LatLng(51.52, -0.12),
  ];

  BookedPage({this.pickupLocation, this.dropLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Page'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          // Flutter map covering 65% of the screen
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: LatLng(51.5, -0.09),
                initialZoom: 13.0,
                maxZoom: 19.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: _markers,
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _polylinePoints,
                      strokeWidth: 4.0,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // White container for loading animation and text
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Loading animation
                const SpinKitCircle(
                  color: Colors.blue,
                  size: 30.0,
                ),
                SizedBox(height: 10),

                // Searching text
                Text(
                  'Searching...',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),

          // Footer button "Cancel" to navigate to HomePage
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Cancel'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
