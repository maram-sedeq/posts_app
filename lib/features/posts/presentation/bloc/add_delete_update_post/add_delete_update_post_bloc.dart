import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/error/failures.dart';
import 'package:posts_app/core/strings/failures.dart';
import 'package:posts_app/core/strings/messages.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/usecases/add_post.dart';
import 'package:posts_app/features/posts/domain/usecases/delete_post.dart';
import 'package:posts_app/features/posts/domain/usecases/update_post.dart';

part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
final AddPostUsecase addPost;
final DeletePostUsecase deletePost;
final UpdatePostUsecase updatePost;

  AddDeleteUpdatePostBloc({required this.addPost, required this.deletePost, required this.updatePost}) : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async{
      
   if(event is AddPostEvent){
   emit(LoadingAddDeleteUpdatePostState());
   final failureOrDoneMessage = await addPost(event.post);
   failureOrDoneMessage.fold(
    (failure) =>{
      emit(ErrorAddDeleteUpdatePostState(message: _mapFailureToMessage(failure)))
    },
    (_)=>{
      emit(MessageAddDeleteUpdatePostState(message: ADD_SUCCESS_MESSAGE ))
    }
    );
   }


   else if(event is UpdatePostEvent){
   emit(LoadingAddDeleteUpdatePostState());
   final failureOrDoneMessage = await updatePost(event.post);
   failureOrDoneMessage.fold(
    (failure) =>{
      emit(ErrorAddDeleteUpdatePostState(message: _mapFailureToMessage(failure)))
    },
    (_)=>{
      emit(MessageAddDeleteUpdatePostState(message: UPDATE_SUCCESS_MESSAGE ))
    }
    );
   }


   else if(event is DeletePostEvent){
   emit(LoadingAddDeleteUpdatePostState());
   final failureOrDoneMessage = await deletePost(event.postId);
   failureOrDoneMessage.fold(
    (failure) =>{
      emit(ErrorAddDeleteUpdatePostState(message: _mapFailureToMessage(failure)))
    },
    (_)=>{
      emit(MessageAddDeleteUpdatePostState(message: DELETE_SUCCESS_MESSAGE ))
    }
    );
   }

    });
  }

  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure:
      return SERVER_FAILURE_MESSAGE;

      case offLineFailure:
      return OFFLINE_FAILURE_MESSAGE;

      
      default:
      return "Unexpectered error, please try again";
    }
  }
}
