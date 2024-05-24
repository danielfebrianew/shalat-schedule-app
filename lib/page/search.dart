import 'package:flutter/material.dart';
import 'package:jadwal_sholat/model/location_model.dart';
import 'package:jadwal_sholat/page/jadwal.dart';

const accessoriesColor = Color(0xFF314833);
const backgroundColor = Color(0xFFECE5D8);
const iconColor = Color(0xFF314833);
const textColor = Color(0xFF314833);
const fillColor = Color(0xFFECE5D8);

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  TextEditingController queryController = TextEditingController();

  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    ).then((value) => _dateTime = value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: accessoriesColor,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(color: backgroundColor),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: mainColor,
                  backgroundColor: mainColor,
                  shadowColor: Colors.black,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: const Size(90, 40),
                ),
                child: const Text(
                  'Pilih Tanggal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  _showDatePicker();
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: queryController,
                style: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: accessoriesColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: accessoriesColor,
                      width: 3,
                    ),
                  ),
                  filled: true,
                  fillColor: fillColor,
                  focusColor: accessoriesColor,
                  hintText: 'Masukkan kota',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: iconColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: accessoriesColor,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  String query = queryController.text;
                  print('query: $query');

                  Future<List<Location>> locationResults =
                      Location.fetchLocation(query);
                  locationResults.then((value) {
                    if (value.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JadwalPage(
                            location: value[0].lokasi,
                            id: value[0].id,
                            tahun: _dateTime.year.toString(),
                            bulan: _dateTime.month.toString(),
                          ),
                        ),
                      );
                    }
                  });
                },
                child: const Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
