import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/failures.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/repositories/posts_repository.dart';

class UpdatePostUsecase {
  final PostsRepository repository;

  new({required this.repository});


  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}