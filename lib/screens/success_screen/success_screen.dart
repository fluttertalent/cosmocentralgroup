
import 'package:cosmopolitan/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

import '../common/custom_button.dart';

class ResetSuccess extends StatelessWidget {
  const ResetSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/cos logo.png"),
                  Image.asset(
                      "assets/images/Central-Developments-Logo_CMYK_Charcoal 1.png"),
                ],
              ),
              Spacer(),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Color(0xFFEEF1FF),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: Color(0xFF243690),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Reset Successfully",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color(0xFF243690),
                ),
              ),
              Text(
                "Your password has been successfully reset.",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              CustomButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                },
                title: 'LOGIN NOW',
              )
            ],
          ),
        ),
      ),
    );
  }
}
