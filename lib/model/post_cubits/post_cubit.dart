import 'package:demoproject/data/post_model.dart';
import 'package:demoproject/data/repository/post_repository.dart';
import 'package:demoproject/model/post_cubits/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super( PostLoadingState()){
    fetchPosts();
  }

  PostRepository postRepository= PostRepository();

  void fetchPosts() async {
    try{
      List<PostModel> posts =await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    }
    catch(ex){
      emit(PostErrorState(ex.toString()));
    }
  }
}