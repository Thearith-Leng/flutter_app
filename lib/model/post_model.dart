class PostModel {
  const PostModel({
    required this.title,
    required this.imageUrl,
    this.author
  });

  final String title;
  final String imageUrl;
  final String? author;



}