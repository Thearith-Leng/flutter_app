import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/home_controller.dart';
import 'package:flutter_app/model/post_model.dart';
import 'package:flutter_app/model/slider_model.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    // final List<SliderModel> banners = <SliderModel>[
    //   SliderModel(
    //     title: 'Welcome to GetX Basic',
    //     subtitle: 'Learn flutter with GetX',
    //     imageUrl: 'https://picsum.photos/800/400?random=1',
    //   ),
    //   SliderModel(
    //     title: 'Flutter Development',
    //     subtitle: 'Build modern mobile applications',
    //     imageUrl: 'https://picsum.photos/800/400?random=2',
    //   ),
    //   SliderModel(
    //     title: 'GetX State Management',
    //     subtitle: 'Simple and powerful state management',
    //     imageUrl: 'https://picsum.photos/800/400?random=3',
    //   ),
    // ];
    //
    // final List<PostModel> latestPosts = <PostModel>[
    //   PostModel(
    //     title: 'Getting Started with Flutter',
    //     imageUrl: 'https://picsum.photos/200/200?random=10',
    //   ),
    //   PostModel(
    //     title: 'Understanding GetX',
    //     imageUrl: 'https://picsum.photos/200/200?random=11',
    //   ),
    //   PostModel(
    //     title: 'Flutter Navigation',
    //     imageUrl: 'https://picsum.photos/200/200?random=12',
    //   ),
    // ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
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
                          child: Text(
                            'R',
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
                      Text(
                        'GetX Basic',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      // Design for Text email
                      const SizedBox(height: 5),
                      Text(
                        'admin@example.com',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
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
                    leading: const Icon(
                      Icons.people_outline,
                      size: 30,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      'Users',
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
                    leading: const Icon(
                      Icons.person_add_alt_1_outlined,
                      size: 30,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      'New user',
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
                    leading: const Icon(
                      Icons.translate_outlined,
                      size: 30,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      'Language',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      'English',
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
                    leading: const Icon(
                      Icons.signal_cellular_alt,
                      size: 30,
                      color: Colors.lightGreen,
                    ),
                    title: const Text(
                      'Connection',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      'Online',
                      style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Logout
            const Divider(height: 1),

            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              leading: const Icon(
                Icons.logout,
                size: 30,
                color: Colors.redAccent,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          // =========================
          // Loading
          // =========================
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: const EdgeInsets.only(bottom: 20, top: 20),

            children: <Widget>[
              // =========================
              // Carousel
              // =========================
              CarouselSlider(
                items: controller.banners.map((SliderModel banner) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.greenAccent,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        // =========================
                        // Image
                        // =========================
                        Image.network(
                          banner.fullImageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) {
                            return const Icon(
                              Icons.image_not_supported_outlined,
                              size: 40,
                            );
                          },
                        ),

                        // =========================
                        // Dark Overlay
                        // =========================
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: <Color>[Colors.transparent, Colors.black54],
                            ),
                          ),
                        ),

                        // =========================
                        // Banner Text
                        // =========================
                        Positioned(
                          left: 16,
                          right: 16,
                          bottom: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                banner.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),

                              if (banner.subtitle != null &&
                                  banner.subtitle!.isNotEmpty)
                                Text(
                                  banner.subtitle!,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),

                options: CarouselOptions(
                  height: 190,
                  viewportFraction: 0.95,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  enlargeCenterPage: true,
                ),
              ),

              const SizedBox(height: 24),

              // =========================
              // Latest Posts Title
              // =========================
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Latest Posts',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 8),

              // =========================
              // Post List
              // =========================
              ...controller.latestPosts.map((PostModel post) {
                final String url = post.fullImageUrl;

                return Card(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Padding(
                    padding: const EdgeInsetsGeometry.all(8),
                    child: Row(
                      children: <Widget>[
                        // =========================
                        // Post Image
                        // =========================
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(8),
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) {
                                return const ColoredBox(
                                  color: Colors.greenAccent,
                                  child: Icon(Icons.article_outlined),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        // =========================
                        // Post Information
                        // =========================
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                post.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),

                              const SizedBox(height: 4),

                              Text(
                                post.author?.displayName ?? 'Unknown',
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}
