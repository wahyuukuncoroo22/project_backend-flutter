import 'package:flutter/material.dart';
import 'package:project_frontendmp/bookingpage.dart';

class ArmadaDetailPage extends StatelessWidget {
  final String type;
  final String code;
  final double pricePerSeat;
  final String departureLocation;
  final String arrivalLocation;
  final String departureDateTime;
  final String arrivalDateTime;

  ArmadaDetailPage({
    required this.type,
    required this.code,
    required this.pricePerSeat,
    required this.departureLocation,
    required this.arrivalLocation,
    required this.departureDateTime,
    required this.arrivalDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Spacer(),
            Row(
              children: [
                Image.asset(
                  'assets/images/gambar2.png',
                  height: 50,
                ),
                const SizedBox(width: 8),
                const Text(
                  "The_Buzee.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/gambar1.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 165,
                ),
                Positioned(
                  bottom: 10,
                  left: 16,
                  child: Text(
                    type,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      backgroundColor: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$type Reclining Seat 2-2",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "IDR ${pricePerSeat.toStringAsFixed(0)} / Kursi",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            departureLocation,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            departureDateTime,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward, color: Colors.blue),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            arrivalLocation,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            arrivalDateTime,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(height: 32),
                  Text(
                    "Fasilitas Armada",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildFacilityIcon(Icons.ac_unit, "AC"),
                      _buildFacilityIcon(Icons.wc, "Toilet"),
                      _buildFacilityIcon(Icons.tv, "LCD TV"),
                      _buildFacilityIcon(Icons.music_note, "Musik"),
                      _buildFacilityIcon(Icons.bed, "Selimut"),
                      _buildFacilityIcon(Icons.fastfood, "Snack"),
                      _buildFacilityIcon(Icons.dining, "Service Makan"),
                      _buildFacilityIcon(
                          Icons.airline_seat_legroom_extra, "Leg Rest"),
                      _buildFacilityIcon(Icons.local_drink, "Free Air Minum"),
                      _buildFacilityIcon(
                          Icons.airline_seat_recline_normal, "Reclining Seat"),
                      _buildFacilityIcon(Icons.support_agent, "Pramugara/i"),
                    ],
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPage(
                              type: type,
                              code: code,
                              departureLocation: departureLocation,
                              arrivalLocation: arrivalLocation,
                              departureDateTime: departureDateTime,
                              arrivalDateTime: arrivalDateTime,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: Text(
                        "Pesan Sekarang",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFacilityIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 36, color: Colors.blue),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
