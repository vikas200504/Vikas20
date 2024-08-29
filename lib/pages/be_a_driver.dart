import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'DriverRoutePage.dart';

class BeADriverPage extends StatefulWidget {
  @override
  _BeADriverPageState createState() => _BeADriverPageState();
}

class _BeADriverPageState extends State<BeADriverPage> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();

  // Example list of markers
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

  void _searchLocation() {
    // Implement search functionality here, e.g., move map to a specific location
    // For example, to move to a specific point:
    // _mapController.move(LatLng(newLatitude, newLongitude), newZoomLevel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Be a Driver'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search location...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchLocation,
                ),
              ],
            ),
          ),
          Expanded(
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
          // Footer with 'Select Route' button
          SizedBox(
            width: double.infinity, // Cover the entire width of the row
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DriverRoutePage()),
                );
              },
              child: Text(
                'Select Route',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.grey[800], // Example color, customize as needed
                padding: EdgeInsets.symmetric(
                    vertical: 16), // Adjust vertical padding
              ),
            ),
          ),
        ],
      ),
    );
  }
}
