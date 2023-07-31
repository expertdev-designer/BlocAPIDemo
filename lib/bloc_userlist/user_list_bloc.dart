// BLoC
import 'package:demoproject/bloc_userlist/user_list_event.dart';
import 'package:demoproject/bloc_userlist/user_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_list_model/user.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  List<User> _users = [];

  //UserListBloc(super.initialState);
  UserListBloc() : super(UserListInitialState());

  UserListState get initialState => UserListInitialState();

  @override
  Stream<UserListState> mapEventToState(UserListEvent event) async* {
    if (event is AddUserEvent) {
      _users.add(event.user);
    } else if (event is DeleteUserEvent) {
      _users.removeWhere((user) => user.id == event.userId);
    } else if (event is UpdateUserEvent) {
      final index = _users.indexWhere((user) => user.id == event.user.id);
      if (index >= 0) {
        _users[index] = event.user;
      }
    }

    yield UserListUpdatedState(List.from(_users));
  }
}






















//
// import 'package:demoproject/bloc_userlist/user_list_event.dart';
// import 'package:demoproject/bloc_userlist/user_list_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// part 'user_list_event.dart';
// part 'user_list_state.dart';
//
// class UserListBloc extends Bloc<UserListEvent,UserListState>{
//   UserListBloc(): super(UserListInitial(users: [])){
//     on<AddUser>(_addUser);
//     on<DeleteUser>(_deleteUser);
//     on<UpdateUser>(_updateUser);
//   }
// }
//
// void _addUser(AddUser event,Emitter<UserListState> emit) {
//   state.users.add(event.user);
//   emit(UserListUpdated(users: state.users));
// }
//
// void _deleteUser(DeleteUser event,Emitter<UserListState> emit) {
//   state.users.remove(event.user);
//   emit(UserListUpdated(users: state.users));
// }
//
// void _updateUser(UpdateUser event,Emitter<UserListState> emit) {
//   for(int i=0; i<state.users.length; i++){
//     if(event.user.id == state.users[i].id){
//       state.users[i] = event.user;
//     }
//   }
//   emit(UserListUpdated(users: state.users));
// }

