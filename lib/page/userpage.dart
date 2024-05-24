import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jadwal_sholat/model/user_model.dart';

const mainColor = Color(0xFF314833);
const fillColor = Color(0xFFECE5D8);
const textColor = Colors.white;

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  Future<void> deleteAllUsers() async {
    var usersBox = await Hive.openBox('users');
    await usersBox.clear();
    setState(() {}); // Refresh the UI after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HiveDB User List',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: mainColor,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: fillColor,
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: Hive.openBox("users"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    } else {
                      var users = Hive.box("users");

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: ((context, index) {
                          // print("user length ${users.length}");
                          User user = users.getAt(index);
                          return Column(
                            children: [
                              ListTile(
                                title: Text(user.email),
                                subtitle: Text(user.password),
                              ),
                              const Divider()
                            ],
                          );
                        }),
                      );
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            // Expanded(
            //   child: FutureBuilder(
            //     future: Hive.openBox("users"),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done) {
            //         if (snapshot.hasError) {
            //           return Center(
            //             child: Text('${snapshot.error}'),
            //           );
            //         } else {
            //           var users = Hive.box("users");

            //           return Column(
            //             children: [
            //               ElevatedButton(
            //                 onPressed: deleteAllUsers,
            //                 style: ElevatedButton.styleFrom(
            //                   primary: mainColor, // Button color
            //                 ),
            //                 child: const Text(
            //                   'Delete All Users',
            //                   style: TextStyle(color: textColor),
            //                 ),
            //               ),
            //               Expanded(
            //                 child: ListView.builder(
            //                   physics: const BouncingScrollPhysics(),
            //                   shrinkWrap: true,
            //                   itemCount: users.length,
            //                   itemBuilder: ((context, index) {
            //                     User user = users.getAt(index);
            //                     return Column(
            //                       children: [
            //                         ListTile(
            //                           title: Text(user.email),
            //                           subtitle: Text(user.password),
            //                         ),
            //                         const Divider()
            //                       ],
            //                     );
            //                   }),
            //                 ),
            //               ),
            //             ],
            //           );
            //         }
            //       } else {
            //         return const Center(child: CircularProgressIndicator());
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
