import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),

          //Login Form
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        'Log In'.tr,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'NotoSansKhmer',
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Username
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your Email'.tr,
                        prefixIcon: const Icon(Icons.person_outline, color: Colors.blueGrey),
                        // Border ធម្មតាពេលមិនទាន់ចុច
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 2.0,
                          ),
                        ),

                        // Border ពេលកំពុងចុចបញ្ចូលទិន្នន័យ (Focus State)
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Password
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your Password'.tr,
                        prefixIcon: const Icon(Icons.lock_outline, color: Colors.blueGrey),
                        // Border ធម្មតាពេលមិនទាន់ចុច
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 2.0,
                          ),
                        ),

                        // Border ពេលកំពុងចុចបញ្ចូលទិន្នន័យ (Focus State)
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Log In Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          // login function
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.login, size: 25),
                            SizedBox(width: 8),
                            Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Forgot Password
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Do not have an account? Register'.tr,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'NotoSansKhmer',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
