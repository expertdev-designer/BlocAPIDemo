
import 'package:demoproject/screens/home_screen.dart';
import 'package:demoproject/screens/sign_in_screen.dart';
import 'package:demoproject/screens/user_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/post_cubits/post_cubit.dart';
//import 'user_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: MaterialApp(
        title: 'User List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:HomeScreen(),
        //UserListScreen(),
      ),
    );
  }
}

















// import 'package:demoproject/model/post_cubits/post_cubit.dart';
// import 'package:demoproject/screens/home_screen.dart';
// import 'package:demoproject/screens/login.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
//
// import 'data/post_model.dart';
// import 'data/repository/post_repository.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   PostRepository postRepository =PostRepository();
//   List<PostModel> postModels= await postRepository.fetchPosts();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context)=>PostCubit(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
//           useMaterial3: true,
//         ),
//         home:LoginPage(),
//         // HomeScreen(),
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       appBar: AppBar(
//
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//         title: Text(''),
//       ),
//       body:Center()
//
//
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//  }
