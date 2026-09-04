import 'dart:ui';

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
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================
              // Upload Image
              // =========================
              InkWell(
                onTap: () {
                  // TODO: Pick Image
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xCDA7FF73),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFD0E1E1),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 65,
                        color: Colors.green,
                      ),

                      SizedBox(height: 15),

                      Text(
                        'Tap here to upload an image'.tr,
                        style: TextStyle(
                          fontFamily: 'NotoSansKhmer',
                          fontSize: 16,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 2),

              Center(
                child: Text(
                  'The image will be uploaded after post is created'.tr,
                  style: TextStyle(
                    fontFamily: 'NotoSansKhmer',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF475569),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // =========================
              // Title
              // =========================
              Text(
                'Title'.tr,
                style: TextStyle(
                  fontFamily: 'NotoSansKhmer',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF475569),
                ),
              ),

              const SizedBox(height: 10),

              TextFormField(
                style: const TextStyle(
                  fontFamily: 'NotoSansKhmer',
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your title'.tr,
                  hintStyle: const TextStyle(
                    fontFamily: 'NotoSansKhmer',
                    color: Color(0xFF475569),
                  ),

                  prefixIcon: const Icon(
                    Icons.title,
                    color: Color(0xFF64748B),
                  ),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xFFD1D5DB),
                    ),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xFFD1D5DB),
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),

                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // =========================
              // Content
              // =========================
              Text(
                'Content'.tr,
                style: TextStyle(
                  fontFamily: 'NotoSansKhmer',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF475569),
                ),
              ),

              const SizedBox(height: 10),

              TextFormField(
                maxLines: 8,
                minLines: 6,

                textAlignVertical: TextAlignVertical.top,

                style: const TextStyle(
                  fontFamily: 'NotoSansKhmer',
                  fontSize: 16,
                ),

                decoration: InputDecoration(
                  hintText: 'Write your content...'.tr,
                  hintStyle: const TextStyle(
                    fontFamily: 'NotoSansKhmer',
                    color: Color(0xFF475569),
                  ),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xFFD1D5DB),
                    ),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xFFD1D5DB),
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),

                  contentPadding: const EdgeInsets.all(20),
                ),
              ),

              const SizedBox(height: 30),

              // =========================
              // Publish Switch
              // =========================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Published'.tr,
                        style: TextStyle(
                          fontFamily: 'NotoSansKhmer',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF374151),
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        'Visible to everyone'.tr,
                        style: TextStyle(
                          fontFamily: 'NotoSansKhmer',
                          fontSize: 15,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),

                  Switch(
                    value: true,
                    activeThumbColor: Colors.green,
                    onChanged: (value) {
                      // TODO: Change publish status
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // =========================
              // Create Button
              // =========================
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Create Post
                  },

                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),

                  label: Text(
                    'Create Post'.tr,
                    style: TextStyle(
                      fontFamily: 'NotoSansKhmer',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
