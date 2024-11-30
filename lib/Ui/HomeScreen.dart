import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homescreen extends StatefulWidget {
  final String email;
  const Homescreen({super.key, required this.email});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF01293B),
      appBar: AppBar(centerTitle: true,title: Text(
        'Welcome  Screen',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFFF6F6F6),
          fontSize: 32.sp,
          fontFamily: 'sfprodisplay',
          fontWeight: FontWeight.w700,
          letterSpacing: 0.80.w,
        ),
      ) ,  backgroundColor: const Color(0xFF01203B),),
      body: Container(width: double.infinity.w,
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
      child:  Center(
        child: Text(
          widget.email,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFFF6F6F6),
            fontSize: 25.sp,
            fontFamily: 'sfprodisplay',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.80.w,
          ),
        ),
      ),

      ),
    );
  }
}

