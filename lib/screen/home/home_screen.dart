import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Home Screen',
            style: TextStyle(
              color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: MediaQuery.of(context).size.width * 0.72,

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),

        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              height: 310,
              color: Colors.green,
              child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile Circle
                        const CircleAvatar(
                          radius: 45,
                          // backgroundImage: AssetImage(
                          //   'assets/images/profile.jpg'
                          // ),
                          backgroundColor: Colors.white,
                            child: Center(
                              child: Text('R',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ),

                        // Design for Text GetX Basic
                        const SizedBox(height: 20),
                        Text('GetX Basic',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        // Design for Text email
                        const SizedBox(height: 5),
                        Text('admin@example.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),

            // Menu
            // Expanded យកកន្លែងទំនេរដែលនៅសល់ទាំងអស់ ហើយពង្រីក Widget នេះឲ្យពេញកន្លែងនោះ
            Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    // Users
                    ListTile(
                      leading: const Icon(Icons.people_outline, size: 30, color: Colors.blueGrey),
                      title: const Text('Users',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // onTap: (){},
                    ),

                    // New User
                    ListTile(
                      leading: const Icon(Icons.person_add_alt_1_outlined, size: 30, color: Colors.blueGrey),
                      title: const Text('New user',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // onTap: () {},
                    ),

                    const Divider(),

                    // Language
                    ListTile(
                      leading: const Icon(Icons.translate_outlined, size: 30, color: Colors.blueGrey),
                      title: const Text('Language',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Text('English',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //onTap: () {},
                    ),

                    // Connection
                    ListTile(
                      leading: const Icon(Icons.signal_cellular_alt, size: 30, color: Colors.lightGreen),
                      title: const Text('Connection',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Text('Online',
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
            ),

            // Logout
            const Divider(height: 1),

            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              leading: const Icon(Icons.logout, size: 30, color: Colors.redAccent),
              title: const Text('Logout',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //onTap: () {},
            )
          ],
        ),

      ),
      body: Center(
        child: Text(
          'Welcome to the Home Screen',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
