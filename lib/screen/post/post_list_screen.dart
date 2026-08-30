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
        title: Text('Post Screen',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: Obx(() {

        //Loading
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        //Error
        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Text(controller.errorMessage.value));
        }

        //Empty
        if (controller.posts.isEmpty) {
          return Center(child: Text('No posts found',
            style: Theme.of(context).textTheme.headlineMedium)
          );
        }

        print('Building ListView');
        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: controller.posts.length +
              (controller.isLoadingMore.value ? 1 : 0),
          itemBuilder: (context, index) {
            print('BUILD ITEM: $index');

            if (index == controller.posts.length) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final Data post = controller.posts[index];

            return ListTile(
              leading: CircleAvatar(
                child: Text('${post.id ?? ''}'),
              ),
              title: Text(post.title ?? ''),
              subtitle: Text(post.content ?? ''),
            );
          },
        );
        return ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(title: Text('Test Item $index'));
          },
        );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/posts/form');
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
