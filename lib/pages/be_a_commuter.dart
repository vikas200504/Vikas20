import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'addressPage.dart'; // Import AddressPage

class BeACommuterPage extends StatefulWidget {
  @override
  _BeACommuterPageState createState() => _BeACommuterPageState();
}

class _BeACommuterPageState extends State<BeACommuterPage> {
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
        title: Text('Be a Commuter'),
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
                initialCenter: LatLng(51.5, -0.09), // Updated center
                initialZoom: 13.0, // Updated zoom
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddressPage()),
                );
              },
              child: Text('Select Address'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
