import 'package:flutter/material.dart';
import '../bottom_navbar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.grey[800]),
        actions: [
          Icon(Icons.account_circle, color: Colors.grey[800]),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting section
            Text(
              "Halo, Friska!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "Semoga harimu menyenangkan!",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),

            // Tab Section
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTab("Tugasku", isSelected: true),
                SizedBox(width: 10),
                _buildTab("Projek"),
                SizedBox(width: 10),
                _buildTab("Catatan"),
              ],
            ),
            SizedBox(height: 20),
            // Bungkus semua elemen dalam ListView agar bisa digulir
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10.0),
                children: [
                  // Card Section
                  Column(
                    children: [
                      SizedBox(
                        height: 250,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.7),
                          itemCount: 3,
                          onPageChanged: (int index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            final cardData = [
                              {
                                "title": "Mobile Programming",
                                "subtitle": "UTS",
                                "clock": "10.00",
                                "date": "17 Oktober 2024",
                                "color": Colors.deepPurple,
                                "icon": Icons.fact_check,
                              },
                              {
                                "title": "Pulau Dewata",
                                "subtitle": "Jalan-jalan",
                                "clock": "06.00",
                                "date": "24 Oktober 2024",
                                "color": Colors.blue,
                                "icon": Icons.airport_shuttle,
                              },
                              {
                                "title": "Kerja Kelompok",
                                "subtitle": "Progress",
                                "clock": "08.00",
                                "date": "7 hari yang lalu",
                                "color": Colors.orange,
                                "icon": Icons.group,
                              },
                            ];

                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              child: _buildCard(
                                title: cardData[index]["title"] as String,
                                subtitle: cardData[index]["subtitle"] as String,
                                clock: cardData[index]["clock"] as String,
                                date: cardData[index]["date"] as String,
                                color: cardData[index]["color"] as Color,
                                icon: cardData[index]["icon"] as IconData,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            height: 8.0,
                            width: _currentPage == index ? 20.0 : 8.0,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Colors.indigo
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Progress Section
                  Text(
                    "Progress",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildProgressItem(
                      "UTS Studi Islam", "2 hari yang lalu", true),
                  _buildProgressItem(
                      "Checkout 11.11", "6 hari yang lalu", false),
                  _buildProgressItem(
                      "Kerja Kelompok", "1 minggu yang lalu", false),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }

  Widget _buildTab(String title, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        // Use Row to arrange elements horizontally
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween, // Align content horizontally
        children: [
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Visibility(
            // Show icon only for selected tab
            visible: isSelected,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_drop_down_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required String clock,
    required String date,
    required Color color,
    required IconData icon,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4, // Tambahkan shadow untuk efek 3D
      color: color,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              clock,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            SizedBox(height: 40),
            Text(
              date,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressItem(String title, String date, bool isCompleted) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(
            isCompleted ? Icons.check_circle : Icons.cancel,
            color: isCompleted ? Colors.green : Colors.red,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}