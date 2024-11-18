import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // For File

void main() {
  runApp(ProfilePages());
}

class ProfilePages extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePages> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  File? _image; // Variable to hold the selected image

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    
    if (image != null) {
      setState(() {
        _image = File(image.path); // Update the state with the selected image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Action for back button
              Navigator.pop(context); // Assuming you want to go back
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.brown,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage, // Call the method to pick an image
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      backgroundImage: _image != null ? FileImage(_image!) : null, // Set the image if available
                      child: _image == null
                          ? Icon(Icons.camera_alt, color: Colors.white) // Placeholder icon
                          : null,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: _pickImage, // Call the method to pick an image
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    _buildTextField("First Name", _firstNameController),
                    _buildTextField("Last Name", _lastNameController),
                    _buildTextField("Email", _emailController),
                    _buildTextField("Birth", _birthController),
                    _buildTextField("Branch", _branchController),
                    _buildPasswordField("Change Password", _passwordController),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Action for save button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900], // Button color
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text("Save"),
                    ),
                    SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () {
                        // Action for logout button
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.brown, // Text color
                        side: BorderSide(color: Colors.brown),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text("Logout"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
