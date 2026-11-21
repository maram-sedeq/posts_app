import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/failures.dart';
import 'package:posts_app/features/posts/domain/repositories/posts_repository.dart';

class DeletePostUsecase {
  final PostsRepository repository;
  new({required this.repository});
  
Future<Either<Failure, Unit>> call(int postId) async{
  return await repository.deletePost(postId);
}

}