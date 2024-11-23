import 'package:flutter/material.dart';
import 'package:jadwalku/pages/BuatTugasPage.dart';
import 'package:jadwalku/pages/DashboardPage.dart';
import '../bottom_navbar.dart';

class ListJadwalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: Text('List Jadwal', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.indigo[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.black87),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Header
          Container(
            color: Colors.indigo[100],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Nov, 2024',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 120),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BuatTugasPage()),
                        );
                      },
                      child: Text('+ Tugas'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Baris tanggal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDateItem('17', 'Min', isSelected: true),
                    _buildDateItem('18', 'Sen', ),
                    _buildDateItem('19', 'Sel'),
                    _buildDateItem('20', 'Rab'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Daftar Tugas
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Tugas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildTaskCard(
                              'UTS Mobile Programming', '10:00 - 14:00'),
                          SizedBox(height: 8),
                          _buildTaskCard('Ngerjakan Tugas', '18:00'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }



  Widget _buildDateItem(String day, String weekday, {bool isSelected = false}) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple : Colors.transparent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          Text(
            weekday.substring(0, 3),
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard(String title, String time) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.assignment, color: Colors.deepPurple[700]),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(time),
        trailing: Icon(Icons.more_vert, color: Colors.black),
      ),
    );
  }
}