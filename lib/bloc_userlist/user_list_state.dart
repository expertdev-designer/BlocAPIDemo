// States
import '../model/user_list_model/user.dart';

abstract class UserListState {}

class UserListInitialState extends UserListState {}

class UserListUpdatedState extends UserListState {
  final List<User> users;

  UserListUpdatedState(this.users);
}













// import 'package:demoproject/model/user_list_model/user.dart';
//
// abstract class UserListState{
//   List<User> users;
//   UserListState({required this.users});
// }
//
// class UserListInitial extends UserListState{
//   UserListInitial({required List<User> users}): super(users: users);
// }
//
// class UserListUpdated extends UserListState{
//   UserListUpdated({required List<User> users}) : super(users: users);
// }