// user_list_screen.dart
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc_userlist/user_list_bloc.dart';
// import '../bloc_userlist/user_list_event.dart';
// import '../bloc_userlist/user_list_state.dart';
// import '../model/user_list_model/user.dart';
//
// class UserListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('User List')),
//       body: BlocProvider(
//         create: (context) => UserListBloc(), // Create UserListBloc here
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showAddUserDialog(context);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// void _showAddUserDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text('Add User'),
//       content: StatefulBuilder(
//         builder: (context, setState) {
//           return UserForm(
//             onAddUser: (user) {
//               // Add the AddUserEvent to the UserListBloc
//               BlocProvider.of<UserListBloc>(context).add(AddUserEvent(user));
//               Navigator.pop(context);
//             },
//           );
//         },
//       ),
//     ),
//   );
// }
//
// class UserForm extends StatefulWidget {
//   final void Function(User user) onAddUser;
//
//   UserForm({required this.onAddUser});
//
//   @override
//   _UserFormState createState() => _UserFormState();
// }
//
// class _UserFormState extends State<UserForm> {
//   final _nameController = TextEditingController();
//   final _ageController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         TextField(
//           controller: _nameController,
//           decoration: InputDecoration(labelText: 'Name'),
//         ),
//         TextField(
//           controller: _ageController,
//           keyboardType: TextInputType.number,
//           decoration: InputDecoration(labelText: 'Age'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             _addUser(context);
//           },
//           child: Text('Add'),
//         ),
//       ],
//     );
//   }
//   void _addUser(BuildContext context) {
//     final name = _nameController.text;
//     final age = int.tryParse(_ageController.text) ?? 0;
//
//     if (name.isNotEmpty) {
//       final user = User(name: name, age: age, id: 1);
//       BlocProvider.of<UserListBloc>(context).add(AddUserEvent(user));
//       widget.onAddUser(user);
//       Navigator.pop(context);
//     } else {
//       // Show an error message or handle the case when name is empty
//     }
//   }
//
//
//   class UserList extends StatelessWidget {
//   const UserList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//   return BlocBuilder<UserListBloc, UserListState>(
//   builder: (context, state) {
//   if (state is UserListUpdatedState) {
//   final userList = state.users;
//   return ListView.builder(
//   itemCount: userList.length,
//   itemBuilder: (context, index) => ListTile(
//   title: Text(userList[index].name),
//   subtitle: Text('Age: ${userList[index].age}'),
//   trailing: Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//   IconButton(
//   icon: const Icon(Icons.edit),
//   onPressed: () {
//   _showEditDialog(context, userList[index]);
//   },
//   ),
//   IconButton(
//   icon: Icon(Icons.delete),
//   onPressed: () {
//   // Handle delete user here
//   BlocProvider.of<UserListBloc>(context)
//       .add(DeleteUserEvent(userList[index].id));
//   },
//   ),
//   ],
//   ),
//   ),
//   );
//   } else {
//   return Center(child: CircularProgressIndicator());
//   }
//   },
//   );
//   }
//
//
//   void _showEditDialog(BuildContext context, User user) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Edit User'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: TextEditingController(text: user.name),
//               onChanged: (value) => user.name = value,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: TextEditingController(text: user.age.toString()),
//               onChanged: (value) => user.age = int.tryParse(value) ?? 0,
//               decoration: InputDecoration(labelText: 'Age'),
//             ),
//           ],
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               BlocProvider.of<UserListBloc>(context).add(UpdateUserEvent(user));
//               Navigator.pop(context);
//             },
//             child: Text('Save'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('Cancel'),
//           ),
//         ],
//       ),
//     );
//   }
// }

//
// // user_list_screen.dart
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc_userlist/user_list_bloc.dart';
// import '../bloc_userlist/user_list_event.dart';
// import '../bloc_userlist/user_list_state.dart';
// import '../model/user_list_model/user.dart';
//
//
// class UserListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('User List')),
//       body: BlocProvider(
//         create: (context) => UserListBloc(),
//         child: UserList(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showAddUserDialog(context);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
// void _showAddUserDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text('Add User'),
//       content: StatefulBuilder(
//         builder: (context, setState) {
//           return UserForm(
//             onAddUser: (user) {
//               setState(() {
//                 BlocProvider.of<UserListBloc>(context).add(AddUserEvent(user));
//               });
//
//             },
//           );
//         },
//       ),
//     ),
//   );
// }
//
// class UserForm extends StatefulWidget {
//   final void Function(User user) onAddUser;
//
//   UserForm({required this.onAddUser});
//
//   @override
//   _UserFormState createState() => _UserFormState();
// }
//
// class _UserFormState extends State<UserForm> {
//   final _nameController = TextEditingController();
//   final _ageController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         TextField(
//           controller: _nameController,
//           decoration: InputDecoration(labelText: 'Name'),
//         ),
//         TextField(
//           controller: _ageController,
//           keyboardType: TextInputType.number,
//           decoration: InputDecoration(labelText: 'Age'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             _addUser(context);
//           },
//           child: Text('Add'),
//         ),
//       ],
//     );
//   }
//
//   void _addUser(BuildContext context) {
//     final name = _nameController.text;
//     final age = int.tryParse(_ageController.text) ?? 0;
//
//     if (name.isNotEmpty) {
//       final user = User(name: name, age: age,id: 1 );
//       BlocProvider.of<UserListBloc>(context).add(AddUserEvent(user));
//       widget.onAddUser(user);
//       Navigator.pop(context);
//     } else {
//       // Show an error message or handle the case when name is empty
//     }
//   }
// }
//
//
// class UserList extends StatelessWidget {
//   const UserList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UserListBloc, UserListState>(
//       builder: (context, state) {
//         if (state is UserListUpdatedState) {
//           final userList = state.users;
//           return ListView.builder(
//             itemCount: userList.length,
//             itemBuilder: (context, index) =>
//                 ListTile(
//                   title: Text(userList[index].name),
//                   subtitle: Text('Age: ${userList[index].age}'),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.edit),
//                         onPressed: () {
//                           // Handle edit user here
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () {
//                           // Handle delete user here
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
//
//   // Callback function that adds the new user to the list
// //   void _handleAddUser(User user) {
// //     setState(() {
// //       userList.add(user);
// //     });
// //   }
// // }
//
//
// // class UserList extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final userListBloc = BlocProvider.of<UserListBloc>(context);
// //
// //     return BlocBuilder<UserListBloc, UserListState>(
// //       builder: (context, state) {
// //         if (state is UserListUpdatedState) {
// //           final userList = state.users;
// //           return ListView.builder(
// //             itemCount: userList.length,
// //             itemBuilder: (context, index) => ListTile(
// //               title: Text(userList[index].name),
// //               subtitle: Text('Age: ${userList[index].age}'),
// //               trailing: Row(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   IconButton(
// //                     icon: Icon(Icons.edit),
// //                     onPressed: () {
// //                       _showEditDialog(context, userList[index]);
// //                     },
// //                   ),
// //                   IconButton(
// //                     icon: Icon(Icons.delete),
// //                     onPressed: () {
// //                       userListBloc.add(DeleteUserEvent(userList[index].id));
// //                     },
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           );
// //         } else {
// //           return Center(child: CircularProgressIndicator());
// //         }
// //       },
// //     );
// //   }
//
//   void _showEditDialog(BuildContext context, User user) {
//     showDialog(
//       context: context,
//       builder: (context) =>
//           AlertDialog(
//             title: Text('Edit User'),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: TextEditingController(text: user.name),
//                   onChanged: (value) => user.name = value,
//                   decoration: InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   controller: TextEditingController(text: user.age.toString()),
//                   onChanged: (value) => user.age = int.tryParse(value) ?? 0,
//                   decoration: InputDecoration(labelText: 'Age'),
//                 ),
//               ],
//             ),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   BlocProvider.of<UserListBloc>(context).add(
//                       UpdateUserEvent(user));
//                   Navigator.pop(context);
//                 },
//                 child: Text('Save'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('Cancel'),
//               ),
//             ],
//           ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:demoproject/bloc_userlist/user_list_bloc.dart';
// // import 'package:demoproject/bloc_userlist/user_list_event.dart';
// // import 'package:demoproject/bloc_userlist/user_list_state.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// //
// // import '../model/user_list_model/user.dart';
// //
// // class UserHomePage extends StatelessWidget{
// //
// //   void showBottomSheet({
// //     required BuildContext context,
// //     bool isEdit = false,
// //     required int id,
// // })=> showModelBottomSheet(
// //     context:context,
// //     isScrollControlled: true,
// //     builder:(context){
// //       return Padding(
// //         padding: EdgeInsets.only(
// //             bottom: MediaQuery.of(context).viewInsets.bottom),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             buildTextField(controller: name,hint:'Enter name'),
// //             buildTextField(controller: email,hint:'Enter email'),
// //             ElevatedButton(onPressed: (){
// //               final user= User(
// //                 name: name.text,
// //                 email: email.text,
// //                 id: id,
// //               );
// //               if(isEdit){
// //                 userListBloc(context).add(AddUser(user:user));
// //               }
// //               else{
// //                 userListBloc(context).add(UpdateUser(user:user));
// //               }
// //               Navigator.pop(context);
// //             }, child: Text(isEdit ? 'Upadte' : 'Add user'),
// //             ),
// //           ],
// //         ),
// //       );
// //     }
// //   );
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Crud using bloc'),),
// //       floatingActionButton: ElevatedButton(
// //         onPressed: (){
// //           final state = userListBloc(context).state;
// //           final id =state.users.length +1;
// //           showBottomSheet(context: context, id: id);
// //         },
// //         child: Text('Add user'),
// //       ),
// //       body: BlocBuilder<UserListBloc,UserListState> (
// //         builder:(context,state){
// //           if(state is UserListUpdated && state.users.isNotEmpty) {
// //             final users = state.users;
// //             return ListView.builder(
// //                 itemCount: users.length,
// //                 itemBuilder: (context, index) {
// //                   final user = users[index];
// //                   return buildUserTile(context, user);
// //                 }
// //             );
// //           }
// //           else{
// //             return const SizedBox(
// //               width: double.infinity,
// //               child:  Center(child: Text('No users Found'),),
// //             );
// //           }
// //       }
// //       ),
// //     );
// //   }
// //
// //   Widget buildUserTile(BuildContext context, User user){
// //     return ListTile(
// //       title: Text(user.name),
// //       subtitle: Text(user.email),
// //       trailing: Row(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           IconButton(onPressed: (){
// //             userListBloc(context).add(DeleteUser(user:user));
// //           },
// //               icon: const Icon(Icons.delete,size: 30,color: Colors.red,),
// //           ),
// //           IconButton(
// //               onPressed:(){
// //                 name.text = user.name;
// //                 email.text = user.email;
// //                 showBottomSheet(context: context, id: user.id, isEdit: true, builder: (BuildContext context) {  }: builder)
// //               } ,
// //               icon: const Icon(Icons.edit,size: 30,color: Colors.green,))
// //         ],
// //       ),
// //     );
// //   }
// //
// //   static Widget buildTextField({
// //     required TextEditingController controller,
// //     required String hint,
// // })=> TextField(
// //     controller: controller,
// //     decoration: InputDecoration(
// //       hintText: hint,
// //       border: OutlineInputBorder(
// //         borderRadius: BorderRadius.circular(8)
// //       )
// //     ),
// //   )
// }