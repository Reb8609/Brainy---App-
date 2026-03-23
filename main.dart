import 'package:flutter/material.dart';

void main() => runApp(BrainyApp());

class BrainyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Sfondo Viola Pastello delicatissimo
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
              // L'icona del robottino (Verde Acqua)
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Color(0xFFFFE5F1), // Rosa pastello dolce
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Color(0xFF66CCCC), width: 5), // Contorno Verde Acqua tozzo
                ),
                child: Icon(Icons.smart_toy, size: 85, color: Color(0xFF66CCCC)),
              ),
              SizedBox(height: 35),
              // Nuovo nome: BRAINY
              Text(
                "BRAINY",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                  color: Color(0xFF917FB3), // Viola pastello scuro per il testo
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Study smart, not hard.",
                style: TextStyle(fontSize: 16, color: Color(0xFFB1A1C6)),
              ),
              SizedBox(height: 60),
              
              // Bottone Google (Stile Minimal)
              _loginButton("Continue with Google", Colors.white, Colors.black87, Icons.g_mobiledata),
              SizedBox(height: 15),
              
              // Bottone Apple (Stile Minimal)
              _loginButton("Continue with Apple", Colors.black, Colors.white, Icons.apple),
              SizedBox(height: 25),
              
              // Testo Registrazione
              GestureDetector(
                onPressed: () {},
                child: Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(color: Color(0xFF917FB3), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton(String text, Color bgColor, Color textColor, IconData icon) {
    return Container(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: textColor, size: 28),
        label: Text(text, style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600)),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: bgColor == Colors.white ? BorderSide(color: Color(0xFFE0E0E0)) : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
