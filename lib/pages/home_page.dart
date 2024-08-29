import 'package:flutter/material.dart';
import 'be_a_commuter.dart'; // Import BeACommuterPage
import 'be_a_driver.dart'; // Import BeADriverPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _name = 'Your Name';
  String _age = 'Your Age';
  String _vehicle = 'Add your vehicles';
  String _address = 'Add your address';

  bool _isEditing = false;

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _vehicleController = TextEditingController();
  final _addressController = TextEditingController();

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
      if (_isEditing) {
        _nameController.text = _name;
        _ageController.text = _age;
        _vehicleController.text = _vehicle;
        _addressController.text = _address;
      } else {
        _name = _nameController.text;
        _age = _ageController.text;
        _vehicle = _vehicleController.text;
        _address = _addressController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: const Text('HomePage'),
        backgroundColor: Color(0xffffffff),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage('assets/images/profilePic.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: IconButton(
                      icon: Icon(_isEditing ? Icons.save : Icons.edit),
                      color: Colors.white,
                      onPressed: _toggleEditing,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: _isEditing
                  ? TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                      ),
                    )
                  : Text(_name),
            ),
            ListTile(
              title: _isEditing
                  ? TextField(
                      controller: _ageController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your age',
                      ),
                    )
                  : Text(_age),
            ),
            ListTile(
              title: _isEditing
                  ? TextField(
                      controller: _vehicleController,
                      decoration: InputDecoration(
                        hintText: 'Add your vehicles',
                      ),
                    )
                  : Text(_vehicle),
            ),
            ListTile(
              title: _isEditing
                  ? TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        hintText: 'Add your address',
                      ),
                    )
                  : Text(_address),
            ),
            if (_isEditing)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: _toggleEditing,
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: 0.96, // Scale down by 4%
              child: Image.asset('assets/images/mainHomePic.png'),
            ),
          ),
          SizedBox(height: 16), // Space between the image and boxes
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildNavigationBox(
                  context,
                  'Be a Driver',
                  BeADriverPage(),
                  Color(0xFF665E3D), // RGB(102, 94, 61)
                  'assets/images/beDriver.png',
                ),
                _buildNavigationBox(
                  context,
                  'Be a Commuter',
                  BeACommuterPage(),
                  Color(0xFFA59444), // RGB(165, 148, 68)
                  'assets/images/commuterPic.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationBox(BuildContext context, String text, Widget page,
      Color color, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 200, // Width for each box
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color, // Box color
          borderRadius: BorderRadius.circular(6), // Border radius
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
