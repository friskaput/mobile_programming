import 'package:flutter/material.dart';
import 'package:jadwalku/pages/ListJadwalPage.dart';

class BuatTugasPage extends StatefulWidget {
  @override
  _BuatTugasPageState createState() => _BuatTugasPageState();
}

class _BuatTugasPageState extends State<BuatTugasPage> {
  String _startPeriod = 'AM';
  String _endPeriod = 'PM';
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  String? _selectedCategory;

  // Fungsi untuk memilih waktu
  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  // Daftar kategori
  final List<String> _categories = [
    'Tugas Kuliah',
    'Projek',
    'Jalan-jalan',
    'Pekerjaan kantor',
    'Freelance project',
    'Catatan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[300],
      appBar: AppBar(
        title: Text(
          'Buat Tugas Baru',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo[300],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ListJadwalPage()),
            );
          },
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Judul',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tanggal',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildCategoryBottomSheet();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBottomSheet() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setModalState) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 35, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectTime(context, true),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mulai jam',
                              style:
                              TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Container(
                              width: 130,
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey)),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      _startTime != null
                                          ? _startTime!
                                          .format(context)
                                          .split(' ')[0]
                                          : '08.00',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  DropdownButton<String>(
                                    value: _startPeriod,
                                    items: ['AM', 'PM']
                                        .map((period) => DropdownMenuItem(
                                      value: period,
                                      child: Text(period),
                                    ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _startPeriod = value!;
                                      });
                                    },
                                    underline: SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Input untuk waktu selesai
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectTime(context, false),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hingga jam',
                              style:
                              TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Container(
                              width: 130,
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey)),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 60, // Atur lebar kolom waktu
                                    child: Text(
                                      _endTime != null
                                          ? _endTime!
                                          .format(context)
                                          .split(' ')[0]
                                          : '11.59',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  DropdownButton<String>(
                                    value: _endPeriod,
                                    items: ['AM', 'PM']
                                        .map((period) => DropdownMenuItem(
                                      value: period,
                                      child: Text(period),
                                    ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _endPeriod = value!;
                                      });
                                    },
                                    underline: SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                //deskripsi
                Text(
                  'Deskripsi',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Kategori
                Text(
                  'Kategori',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 10, // Jarak antar tombol horizontal
                  runSpacing: 10, // Jarak antar tombol vertikal
                  children: _categories.map((category) {
                    final bool isSelected = _selectedCategory == category;
                    return GestureDetector(
                      onTap: () {
                        setModalState(() {
                          _selectedCategory = category;
                        });
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.deepPurple[400]
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 10,
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                // Tombol Simpan
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListJadwalPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[400],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(600, 40),
                    ),
                    child: Text('Simpan'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}