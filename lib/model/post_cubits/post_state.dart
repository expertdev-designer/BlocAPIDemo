import '../../data/post_model.dart';

abstract class PostState {}

class PostLoadingState extends PostState{}

class PostLoadedState extends PostState{
  final List<PostModel> posts;
  PostLoadedState(this.posts);
}

class PostErrorState extends PostState{
  final String error;
  PostErrorState(this.error);
}

//login states
class LoginState extends PostState{
  final String errorMessage;
  LoginState(this.errorMessage);
}

class LoginValidState extends PostState{}