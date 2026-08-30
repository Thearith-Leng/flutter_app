import 'package:flutter/material.dart';
import 'package:flutter_app/controller/post_controller.dart';
import 'package:flutter_app/model/post_data_model.dart';
import 'package:get/get.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController controller = Get.put(PostController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Screen'.tr,
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
      body: Obx(() {
        // Error
        if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        // Empty
        // if (controller.posts.isEmpty) {
        //   return const Center(child: Text('No posts found'));
        // }

        // Search + Post List
        return Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: SearchBar(
                hintText: 'Search posts...'.tr,

                hintStyle: const WidgetStatePropertyAll(
                  TextStyle(
                    fontFamily: 'NotoSansKhmer',
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),

                textStyle: const WidgetStatePropertyAll(
                  TextStyle(
                    fontFamily: 'NotoSansKhmer',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),

                leading: const Icon(Icons.search),
                onChanged: controller.searchPost,
              ),
            ),
            // Posts
            Expanded(
              child: controller.posts.isEmpty
                  ? const Center(child: Text('No posts found'))
                  : RefreshIndicator(
                      onRefresh: () async {
                        await controller.refreshPosts();
                      },

                      child: ListView.builder(
                        controller: controller.scrollController,

                        physics: const AlwaysScrollableScrollPhysics(),

                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),

                        itemCount:
                            controller.posts.length +
                            (controller.isLoadingMore.value ? 1 : 0),

                        itemBuilder: (context, index) {
                          // Pagination Loading
                          if (index == controller.posts.length) {
                            return const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          final Data post = controller.posts[index];

                          // Post Card
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),

                            padding: const EdgeInsets.all(16),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),

                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1.5,
                              ),
                            ),

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                // Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),

                                  child: SizedBox(
                                    width: 80,
                                    height: 80,

                                    child:
                                        post.imageUrl != null &&
                                            post.imageUrl!.isNotEmpty
                                        ? Image.network(
                                            post.imageUrl!,
                                            fit: BoxFit.cover,

                                            errorBuilder:
                                                (context, error, stackTrace) {
                                                  return Container(
                                                    color: Colors.teal.shade50,

                                                    child: const Icon(
                                                      Icons.article_outlined,
                                                      size: 40,
                                                      color: Colors.teal,
                                                    ),
                                                  );
                                                },
                                          )
                                        : Container(
                                            color: Colors.lightGreenAccent,

                                            child: const Icon(
                                              Icons.article_outlined,
                                              size: 40,
                                              color: Colors.green,
                                            ),
                                          ),
                                  ),
                                ),

                                const SizedBox(width: 16),

                                // Post Information
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      // Title
                                      Text(
                                        post.title ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,

                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 6),

                                      // Content
                                      Text(
                                        post.content ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,

                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      // Author + Date
                                      Text(
                                        'Admincode · 22 Aug 2026',

                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // More Button
                                PopupMenuButton<String>(
                                  icon: const Icon(
                                    Icons.more_vert,
                                    color: Colors.blueGrey,
                                  ),

                                  onSelected: (value) {
                                    if (value == 'edit') {
                                      // Edit post
                                    }

                                    if (value == 'delete') {
                                      // Delete post
                                    }
                                  },

                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        value: 'edit',
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Edit'.tr,
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontFamily: 'NotoSansKhmer',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      PopupMenuItem(
                                        value: 'delete',
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Delete'.tr,
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: 'NotoSansKhmer',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ];
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        );
      }),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed('/post_create');
        },
        backgroundColor: Colors.green,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'New Post'.tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'NotoSansKhmer',
          ),
        ),
      ),
    );
  }
}
