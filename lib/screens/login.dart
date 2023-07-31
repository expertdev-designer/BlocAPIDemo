import 'package:demoproject/model/bloc/sign_in_bloc.dart';
import 'package:demoproject/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _onLoginButtonPressed(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow, Colors.cyanAccent],
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
                    AppText(text: "Login",
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                    SizedBox(height: 15,),
                    AppText(text: "Login your account ",
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color:Colors.black
                    ),
                  ],
                ),
              ),
            ),
           Positioned(
             top: 150,
             left: 0,
             right: 0,
             child: Column(
              children: [
                CustomTextField(
                  labelText: 'Email',
                ),
                SizedBox(height: 20),
                CustomTextField(
                  labelText: 'Password',
                ),
                SizedBox(height: 30),
                MaterialButton(
                  height: 60,
                  minWidth: 300,
                  onPressed: () => _onLoginButtonPressed(context),
                  color: Colors.cyan,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Text('Login',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(text: "Don't have an account?",fontWeight: FontWeight.w300,color: Colors.black),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context)=>BlocProvider(
                              create: (context)=>SignInBloc(),
                              child: SignInPage(),
                        )));
                      },
                        child: AppText(text: 'SignUp',fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black)),
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
                    child: Image.asset('assets/images/bglogin.png')))
        ],
        ),
      ),
    );
  }


  Widget CustomTextField(
      {required String labelText,
        bool obscureText = false,
      }) {
    return Container(
      width: 300,
      height: 50,
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        obscureText: obscureText,
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


