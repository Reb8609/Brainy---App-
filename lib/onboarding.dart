import 'package:flutter/material.dart';
import 'home.dart'; // <--- Collega la terza pagina

class OnboardingScreen extends StatelessWidget {
  final List<Map<String, String>> data = [
    {"title": "Snap & Study", "desc": "Take a photo of your notes.", "icon": "📸"},
    {"title": "Speak Up!", "desc": "Simulate your oral exam.", "icon": "🎤"},
    {"title": "Master It", "desc": "Get your 10/10!", "icon": "🏆"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(color: Color(0xFFFFE5F1), shape: BoxShape.circle, border: Border.all(color: Color(0xFF66CCCC), width: 4)),
              child: Text(data[index]["icon"]!, style: TextStyle(fontSize: 80)),
            ),
            SizedBox(height: 50),
            Text(data[index]["title"]!, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF917FB3))),
            if (index == data.length - 1) ...[
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navigazione verso la Home
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BrainyHome()));
                },
                child: Text("LET'S GO!"),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF66CCCC), foregroundColor: Colors.white),
              )
            ]
          ],
        ),
      ),
    );
  }
}
