import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const mainColor = Color(0xFF314833);
const fillColor = Color(0xFFECE5D8);
const textColor = Colors.white;

class TimeConversionPage extends StatefulWidget {
  const TimeConversionPage({super.key});

  @override
  State<TimeConversionPage> createState() => _TimeConversionPageState();
}

String selectedValue = "WIB";

class _TimeConversionPageState extends State<TimeConversionPage> {
  late DateTime _currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (selectedValue == "WITA") {
          _currentTime = DateTime.now().add(const Duration(hours: 1));
        } else if (selectedValue == "LONDON") {
          _currentTime = DateTime.now().subtract(const Duration(hours: 6));
        } else if (selectedValue == "WIT") {
          _currentTime = DateTime.now().add(const Duration(hours: 2));
        } else {
          _currentTime = DateTime.now();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Time',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        color: fillColor,
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('HH:mm:ss ').format(_currentTime),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        selectedValue,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _operationDropdown(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _operationDropdown() {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 300,
      child: DropdownButtonFormField(
        value: selectedValue,
        items: dropdownItems,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        isExpanded: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: mainColor, width: 3),
          ),
          filled: true,
          fillColor: mainColor,
          focusColor: mainColor,
        ),
        dropdownColor: mainColor,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        iconEnabledColor: fillColor,
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        value: "WIB",
        child: Text("WIB"),
      ),
      const DropdownMenuItem(
        value: "WITA",
        child: Text("WITA"),
      ),
      const DropdownMenuItem(
        value: "WIT",
        child: Text("WIT"),
      ),
      const DropdownMenuItem(
        value: "LONDON",
        child: Text("LONDON"),
      ),
    ];
    return menuItems;
  }
}
