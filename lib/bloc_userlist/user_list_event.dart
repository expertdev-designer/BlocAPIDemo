// Events
import '../model/user_list_model/user.dart';

abstract class UserListEvent {}

class AddUserEvent extends UserListEvent {
  final User user;

  AddUserEvent(this.user);
}

class DeleteUserEvent extends UserListEvent {
  final int userId;

  DeleteUserEvent(this.userId);
}

class UpdateUserEvent extends UserListEvent {
  final User user;

  UpdateUserEvent(this.user);
}










// import '../model/user_list_model/user.dart';
//
// abstract class UserListEvent{}
//
// class AddUser extends UserListEvent{
//   final User user;
//
//   AddUser({required this.user});
// }
//
// class DeleteUser extends UserListEvent {
//   final User user;
//   DeleteUser({required this.user});
// }
//
// class UpdateUser extends UserListEvent {
//   final User user;
//   UpdateUser({required this.user});
// }