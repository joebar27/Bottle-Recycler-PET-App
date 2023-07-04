import 'package:flutter/material.dart';
import 'package:bottlerecyclerapp/core/app_export.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ChangePasswordScreen en construction',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: MediaQuery.of(context).size.height*0.01,
                  color: ColorConstant.redA700,
                  fontSize: getFontSize(
                    30,
                  ),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
                
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
