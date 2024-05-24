import 'package:flutter/material.dart';
import 'package:jadwal_sholat/page/login.dart';
import 'package:jadwal_sholat/page/search.dart';

const mainColor = Color(0xFF314833);
const fillColor = Color(0xFFECE5D8);
const textColor = Colors.white;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget _menu() {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: fillColor),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(25),
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                    color: mainColor,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, Muti!",
                        style: TextStyle(
                          fontSize: 26,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Welcome back!",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sudahkah kamu shalat hari ini?",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Image(
                    image: AssetImage('assets/images/praying.png'),
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 50),
                Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Searchpage(),
                        ),
                      );
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: mainColor,
                      ),
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center, // center align the text
                      child: const Text(
                        'Jadwal Shalat',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: mainColor,
                      backgroundColor: mainColor,
                      shadowColor: Colors.black,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(90, 40),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _menu(),
    );
  }
}
