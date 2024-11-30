

import 'package:authentication_sysytem/Ui/HomeScreen.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Bloc/SignIn_Bloc/sign_in_bloc.dart';
import '../../Repostory/Modelclass/SignInModelClass.dart';
import '../Toastmessage.dart';
import 'Sign_Up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isvisible = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  late SignInModelClass signindata;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01293B),
      body: Container(
        width: double.infinity.w,
        height: double.infinity.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.09, 1.00),
            end: Alignment(0.09, -1),
            colors: [
              Colors.black,
              Color(0xFF272C2F),
              Color(0xFF525E64),
              Color(0xFF3B4F58),
              Color(0xFF01293B)
            ],
          ),
        ),
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInBlocLoading) {
              showDialog(
                  context: context,
                  builder: (ctx) => Center(
                    child: CircularProgressIndicator(),
                  ));

            }
            if (state is SignInBlocLoaded) {
              signindata = BlocProvider.of<SignInBloc>(context)
                  .signInModelClass;


              //
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => Homescreen(email:signindata.email.toString(),)),
                      (route) => false);
              ToastMessage().toastmessage(message: "Successfully");
            }
            if (state is SignInBlocError) {
              Navigator.of(context).pop();
            }
            // TODO: implement listener
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 146.h,
                    ),
                    Text(
                      'Welcome  Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF6F6F6),
                        fontSize: 32.sp,
                        fontFamily: 'sfprodisplay',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.80.w,
                      ),
                    ),
                    SizedBox(
                      height: 68.h,
                    ),
                    TextFormField(
                      cursorColor: Colors.grey,
                      controller: email,
                      style: TextStyle(
                          color: Colors.white, decorationThickness: 0.sp),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 18.h, horizontal: 25.w),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.18000000715255737),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.r)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20.r)),
                        hintText: 'Email ID',
                        hintStyle: TextStyle(
                          color: Color(0xFFA7B0BB),
                          fontSize: 16.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid email!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    TextFormField(
                      obscureText: !isvisible,
                      cursorColor: Colors.grey,
                      controller: password,
                      style: TextStyle(
                          color: Colors.white, decorationThickness: 0.sp),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 18.h, horizontal: 25.w),
                          filled: true,
                          fillColor:
                          Colors.white.withOpacity(0.18000000715255737),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20.r)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20.r)),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFFA7B0BB),
                            fontSize: 16.sp,
                            fontFamily: 'sfprodisplay',
                            fontWeight: FontWeight.w400,
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {

                                  isvisible = !isvisible;
                                });
                              },
                              child: isvisible
                                  ? Icon(BootstrapIcons.eye,
                                  color: Color(0xFFA7B0BB))
                                  : Icon(
                                BootstrapIcons.eye_slash,
                                color: Color(0xFFA7B0BB),
                              ))),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 9) {
                          return 'Enter a valid password!....';
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 70.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          BlocProvider.of<SignInBloc>(context).add(
                              FetchSignInEvent(
                                  email: email.text, password: password.text));
                        }
                        _formKey.currentState?.save();
                      },
                      child: Container(
                        width: 350.w,
                        height: 63.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFDDE0E3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: const Color(0xFF01293B),
                              fontSize: 20.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.20.w,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account',
                          style: TextStyle(
                            color: Color(0xFFDDE0E3),
                            fontSize: 16.sp,
                            fontFamily: 'sfprodisplay',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (_) => const SignUp()),
                                    (route) => false);
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xFF0078FF),
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}