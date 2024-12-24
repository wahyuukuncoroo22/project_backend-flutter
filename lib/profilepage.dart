import 'package:flutter/material.dart';
import 'package:project_frontendmp/bantuandanlayananpage.dart';
import 'package:project_frontendmp/kelolaprofilepage.dart';
import 'package:project_frontendmp/loginpage.dart';
import 'package:project_frontendmp/riwayatticketpage.dart';
import 'package:project_frontendmp/tentangpage.dart';

// Mengubah _buildMenuItem untuk menerima parameter destination
Widget _buildMenuItem(BuildContext context, String title, Widget destination) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () {
      // Navigasi ke halaman tujuan
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );
    },
  );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Section
              Container(
                color: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Section
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Avatar
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 46,
                            backgroundColor: Colors.grey[300],
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Name and Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name
                              const Text(
                                'Ridwan Setiawan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Divider(
                                color: Colors.white,
                                thickness: 1,
                                endIndent: 20,
                              ),
                              const SizedBox(height: 8),

                              // Contact Info
                              Row(
                                children: const [
                                  Icon(Icons.email,
                                      color: Colors.white, size: 16),
                                  SizedBox(width: 8),
                                  Text(
                                    'ridwan@gmail.com',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: const [
                                  Icon(Icons.phone,
                                      color: Colors.white, size: 16),
                                  SizedBox(width: 8),
                                  Text(
                                    '089624643527',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Order History Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigasi ke halaman HistoryScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoryScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent.shade700,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadowColor: Colors.black26,
                          elevation: 8,
                        ),
                        child: Column(
                          children: const [
                            Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Riwayat Pemesanan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Menu Items
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    _buildMenuItem(context, 'Kelola Profile',
                        ProfilePage()), // Halaman Profile
                    const Divider(height: 1),
                    _buildMenuItem(context, 'Tentang The Buzee.com',
                        AboutPage()), // Halaman About
                    const Divider(height: 1),
                    _buildMenuItem(context, 'Bantuan & Layanan',
                        HelpPage()), // Halaman Help

                    // Logout Button
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigasi ke halaman login
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          minimumSize: const Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Keluar Akun',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
