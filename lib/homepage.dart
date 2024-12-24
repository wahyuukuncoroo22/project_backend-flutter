import 'package:flutter/material.dart';
import 'package:project_frontendmp/pilihtiketpage.dart';
import 'ticketpage.dart'; // Import the TicketPage
import 'riwayatticketpage.dart'; // Import the HistoryScreen
import 'profilepage.dart'; // Import the ProfileScreen

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0; // Set the initial index to 0 for the HomePage

  // Pages for the BottomNavigationBar
  final List<Widget> _pages = [
    const HomePageContent(), // HomePage widget
    const EBoardingPassScreen(), // TicketPage widget
    const HistoryScreen(), // HistoryPage widget
    const ProfileScreen(), // ProfilePage widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: 8),
            Image.asset("assets/images/gambar2.png", height: 50),
            const Text(
              "THE_BUZEE.COM",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
      body: _pages[selectedIndex], // Show the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number), label: 'Ticket'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  String? selectedOrigin;
  String? selectedDestination;
  DateTime? selectedDate;
  int selectedSeats = 1; // Default number of seats
  String? selectedClass; // New variable for class selection

  final List<String> origins = [
    'Term Poris Plawad / Tangerang',
    'Jakarta',
    'Bandung',
    'Surabaya',
  ];

  final List<String> destinations = [
    'Kutoarjo / Purworejo',
    'Yogyakarta',
    'Semarang',
    'Bali',
  ];

  final List<String> classes = [
    'Ekonomi',
    'Executive',
    'VVIP',
  ];

  int getAvailableSeats() {
    switch (selectedClass) {
      case 'Ekonomi':
        return 40;
      case 'Executive':
        return 30;
      case 'VVIP':
        return 20;
      default:
        return 0; // No seats available if no class is selected
    }
  }

  void swapLocations() {
    setState(() {
      final temp = selectedOrigin;
      selectedOrigin = selectedDestination;
      selectedDestination = temp;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner image
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Image.asset(
                "assets/images/gambar1.png",
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Origin and Destination Dropdowns
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      prefixIcon: const Icon(Icons.location_on),
                    ),
                    isExpanded: true,
                    value: selectedOrigin,
                    hint: const Text("Pilih Asal"),
                    items: origins.map((String origin) {
                      return DropdownMenuItem<String>(
                        value: origin,
                        child: Text(origin),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOrigin = newValue;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.swap_horiz),
                  onPressed: swapLocations,
                ),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      prefixIcon: const Icon(Icons.flag),
                    ),
                    isExpanded: true,
                    value: selectedDestination,
                    hint: const Text("Pilih Tujuan"),
                    items: destinations.map((String destination) {
                      return DropdownMenuItem<String>(
                        value: destination,
                        child: Text(destination),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDestination = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),

            // Date Picker
            const SizedBox(height: 16.0),
            const Text("Tanggal Keberangkatan"),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedDate == null
                        ? "Pilih Tanggal"
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),

            // Seats and Class Selection
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Jumlah Kursi"),
                      const Spacer(),
                      DropdownButton<int>(
                        value: selectedSeats,
                        items: List.generate(
                                getAvailableSeats(), (index) => index + 1)
                            .map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                        onChanged: (int? newValue) {
                          setState(() {
                            selectedSeats = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      const Text("Kelas Armada"),
                      const Spacer(),
                      DropdownButton<String>(
                        value: selectedClass,
                        items: classes.map((String className) {
                          return DropdownMenuItem<String>(
                            value: className,
                            child: Text(className),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedClass = newValue;
                            selectedSeats = 1; // Reset seats
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Submit Button
            const SizedBox(height: 32.0),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () {
                    if (selectedOrigin != null &&
                        selectedDestination != null &&
                        selectedDate != null &&
                        selectedClass != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TicketPage(
                            origin: selectedOrigin!,
                            destination: selectedDestination!,
                            date: selectedDate!,
                            seats: selectedSeats,
                            classType: selectedClass!,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Silakan lengkapi semua pilihan.")),
                      );
                    }
                  },
                  child: const Text("Cari Tiket"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
