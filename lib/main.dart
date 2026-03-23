import 'package:flutter/material.dart';
import 'onboarding.dart'; // <--- Collega la seconda pagina

void main() => runApp(BrainyApp());

class BrainyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFDF7FF),
        fontFamily: 'Helvetica',
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Color(0xFFFFE5F1),
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Color(0xFF66CCCC), width: 5),
                ),
                child: Icon(Icons.smart_toy, size: 85, color: Color(0xFF66CCCC)),
              ),
              SizedBox(height: 35),
              Text("BRAINY", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, letterSpacing: 3, color: Color(0xFF917FB3))),
              SizedBox(height: 60),
              
              // Tasto Google che porta all'Onboarding
              _loginButton("Continue with Google", Colors.white, Colors.black87, Icons.g_mobiledata, context),
              SizedBox(height: 15),
              _loginButton("Continue with Apple", Colors.black, Colors.white, Icons.apple, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton(String text, Color bgColor, Color textColor, IconData icon, BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: () {
          // Navigazione verso la seconda pagina
          Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
        },
        icon: Icon(icon, color: textColor),
        label: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
