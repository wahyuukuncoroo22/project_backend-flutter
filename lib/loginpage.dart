import 'package:flutter/material.dart';
import 'package:project_frontendmp/homepage.dart';
import 'package:project_frontendmp/lupapasswordpage.dart';
import 'package:project_frontendmp/registerpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Remove the leading (back button)
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue, // Hijau for the appbar
        actions: [
          // Row with the logo and text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Logo Image on the right
                Image.asset(
                  'assets/images/gambar2.png', // Path to your logo image
                  height: 40, // Adjust the logo size
                ),
                SizedBox(width: 8), // Space between logo and text
                // The text next to the logo
                Text(
                  'The_Buzee.com',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Top section: Background image
          Expanded(
            flex: 1,
            child: Center(
              child: Image.asset(
                  'assets/images/gambar1.png', // Path to your background image
                  width: double.infinity,
                  fit: BoxFit.cover),
            ),
          ),
          // Bottom section: Login form
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white, // Background color for the form
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize:
                                  24, // Increased font size for better readability
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Hi there! Nice to see you again.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity, // Full width for input fields
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Silakan masukkan username';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _username = value;
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity, // Full width for input fields
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Silakan masukkan password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _password = value;
                            },
                          ),
                        ),
                        SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity, // Full width for button
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Integrate sign in with homepage navigation
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              textStyle: TextStyle(fontSize: 18),
                            ),
                            child: Text('Sign In'),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Belum punya akun?',
                                style: TextStyle(color: Colors.black)),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Registerpage(),
                                  ),
                                );
                              },
                              child: Text('Daftar',
                                  style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LupapasswordPage(),
                              ),
                            );
                          },
                          child: Text('Lupa Password',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
