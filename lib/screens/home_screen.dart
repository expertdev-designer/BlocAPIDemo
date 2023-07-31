import 'package:demoproject/data/post_model.dart';
import 'package:demoproject/model/post_cubits/post_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../model/post_cubits/post_state.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override

    State<HomeScreen> createState() =>_HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar:Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.grey,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(icon: Icons.home,
                text: 'Home',
              ),
              GButton(icon: Icons.favorite_border,
                text: 'Likes',
              ),
              GButton(icon: Icons.search,
                text: 'search',
              ),
              GButton(icon: Icons.settings,
                text: 'setting',
              ),
            ],),
        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('API Integration',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:  SafeArea(
          child: BlocConsumer<PostCubit, PostState>(
            listener: (context,state){
              if(state is PostErrorState){
                SnackBar snackBar=SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.blue,
                );
              }
            },
            builder: (context ,state) {
              if(state is PostLoadingState){
                return Center(
                child:  CircularProgressIndicator(),
                );
                }
              if(state is PostLoadedState){
                return buildPostListView(state.posts);

                // return ListView.builder(
                // itemCount: state.posts.length,
                // itemBuilder: (context,index){
                //   PostModel post =state.posts[index];
                  // return ListTile(
                  //   title: Text(state.posts[index].title.toString()),
                  //   subtitle: Text(state.posts[index].body.toString()),
                  // );

                //  },
                // );
            }
              return Center(
                child:  Text('An error occured!'),
              );
          },
        ),
      ),
    );
  }

  Widget buildPostListView(List<PostModel> posts){
    return ListView.builder(
        itemBuilder: (context,index){
          PostModel post = posts[index];

          return ListTile(
            title: Text(post.title.toString(),style: TextStyle(fontWeight: FontWeight.w600),),
            subtitle:Text(post.body.toString()),
          );
        });
  }
}