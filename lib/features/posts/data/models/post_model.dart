import '../../domain/entities/post.dart';


class PostModel extends Post{
  
  // Forward the ID to Post; otherwise every model inherits a null ID.
  new({super.id, required super.title, required super.body});

  factory PostModel.fromJson(Map<String,dynamic> json){
    final id = json['id'];
    if (id is! int) {
      throw const FormatException('A loaded post must have an integer id.');
    }
    return PostModel(id: id, title: json['title'], body: json['body']);
  }
  

  Map<String, dynamic> toJson(){
    return {'id': id, 'title': title, 'body': body};
  }
}
