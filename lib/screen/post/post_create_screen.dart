import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCreateScreen extends StatelessWidget {
  const PostCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Create Screen'.tr,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            fontFamily: 'NotoSansKhmer',
          ),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
            'Welcome to the Post Create Screen',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
