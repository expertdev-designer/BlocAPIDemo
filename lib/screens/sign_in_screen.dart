import 'package:demoproject/model/bloc/sign_in_bloc.dart';
import 'package:demoproject/model/bloc/sign_in_event.dart';
import 'package:demoproject/model/bloc/sign_in_state.dart';
import 'package:demoproject/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _onLoginButtonPressed(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow.shade100, Colors.cyanAccent],
          ),
        ),
        child: Stack(
          children: [

            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Container(
                child: Column(
                  children: [
                    AppText(text: "Sign In",
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                    SizedBox(height: 15,),
                    AppText(text: "Create an account ",
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color:Colors.black
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 140,
              left: 0,
              right: 0,
              child: Column(
                children: [

                  BlocBuilder<SignInBloc,SignInState>(
                    builder: (context,state){
                      if(state is SignInErrorState){
                        return Text(state.errorMessage,style: TextStyle(color: Colors.red),);
                      }
                      else{
                        return Container();
                      }
                    },
                  ),
                  SizedBox(height: 8),

                  CustomTextField(
                    labelText: 'Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val){
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangesEvent(emailController.text, passwordController.text),
                      );
                    }
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: passwordController,
                    labelText: 'Password',
                      onChanged: (val){
                        BlocProvider.of<SignInBloc>(context).add(
                          SignInTextChangesEvent(emailController.text, passwordController.text),
                        );
                      }
                  ),
                  SizedBox(height: 30),
                  BlocBuilder<SignInBloc,SignInState>(
                      builder: (context,state) {
                        if(state is SignInLoading){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return MaterialButton(
                          height: 60,
                          minWidth: 300,
                          onPressed: (){
                            if(state is SignInValidState){
                              BlocProvider.of<SignInBloc>(context).add(SignInSubmittedEvent(emailController.text, passwordController.text));
                            }
                          },
                          color: Colors.cyan,
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Text('Sign In',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                        );
                      }
                    ),
                  //),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(text: "Already have an account?",fontWeight: FontWeight.w300,color: Colors.black),
                      SizedBox(width: 5,),
                      AppText(text: 'Login',fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                top: 450,
                left: 0,
                right: 0,
                child: Container(
                    width: 400,
                    height: 400,
                    child: Image.asset('assets/images/bglogin.png'
                    ),
                ),
            ),

          ],
        ),
      ),
    );
  }


  Widget CustomTextField(
      {required String labelText,
        bool obscureText = false,
        TextEditingController? controller,
        TextInputType? keyboardType,
        Function(String)? onChanged,
      }) {
    return Container(
      width: 300,
      height: 50,
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: Colors.black,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget AppText({
    required String text,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.white,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
      ),
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}


