import 'dart:developer';

import 'package:demoproject/model/post_cubits/post_state.dart';
import 'package:dio/dio.dart';

import '../post_model.dart';
import 'api/api.dart';

class PostRepository{
  API api =API();
  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response =await api.sendRequest.get("/posts");
      //log(response.data);
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap)=> PostModel.fromJson(postMap)).toList();
      //postMaps.map((e) => null);
    }
    on DioException catch(ex){
      throw ex;
      //emit(PostErrorState(ex.message.toString()) );
      // if(ex.type== DioExceptionType.other){
      //
      // }
    }
  }
}