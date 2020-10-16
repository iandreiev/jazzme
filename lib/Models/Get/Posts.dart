class Post {
  final int id;
  final int type;
  final String title;
  final String author;
  final String content;
  final String file;
  final String createdAt;

  Post(
      {this.id,
      this.type,
      this.author,
      this.title,
      this.content,
      this.file,
      this.createdAt});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      type: json['type'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      content: json['body'] as String,
      file: json['file'] as String,
      createdAt: json['created_at'] as String,
    );
  }
}
