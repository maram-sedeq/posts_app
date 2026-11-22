import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/widget/loading_widget.dart';
import 'package:posts_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/widgets/message_display_widget.dart';
import 'package:posts_app/features/posts/presentation/widgets/post_list_widget.dart';

class PostsPage extends StatelessWidget{
const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: _buildfloatingbtn()
    );
  }

  PreferredSizeWidget _buildAppbar() => AppBar(title: Text("Posts",
  style: TextStyle(color: Colors.white),),);
  
  Widget _buildBody(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc,PostsState>(
        builder: ((context, state) {
         if(state is LoadedPostsState){
          return LoadingWidget();
         }
         else if(state is LoadedPostsState){
          return RefreshIndicator(
            onRefresh:()=> _onRefresh(context),
            child: PostListWidget(posts: state.posts));
         }
         else if(state is ErrorPostsState){
          return MessageDisplayWidget(message: state.message);
         }
         return Text("Loading");
        })),
    );
  }
   Future<void> _onRefresh(BuildContext context)async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
   }
   Widget _buildfloatingbtn(){
  return FloatingActionButton(onPressed: (){},
  child: Icon(Icons.add),);
}
}