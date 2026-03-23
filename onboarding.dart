import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      "title": "Snap & Study",
      "desc": "Take a photo of your notes.\nBrainy reads everything!",
      "icon": "📸"
    },
    {
      "title": "Speak Up!",
      "desc": "Simulate your exam.\nGet real-time subtitles.",
      "icon": "🎤"
    },
    {
      "title": "Master It",
      "desc": "Review your mistakes.\nGet 10/10 in your test!",
      "icon": "🏆"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF7FF), // Viola chiarissimo
      body: PageView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Immagine/Icona Minimal
            Container(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Color(0xFFFFE5F1), // Rosa pastello
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFF66CCCC), width: 4), // Verde acqua
              ),
              child: Text(data[index]["icon"]!, style: TextStyle(fontSize: 80)),
            ),
            SizedBox(height: 50),
            // Titolo Cicciotto
            Text(
              data[index]["title"]!,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900, // Grassetto forte
                color: Color(0xFF917FB3),
              ),
            ),
            SizedBox(height: 20),
            // Descrizione stile appunti
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                data[index]["desc"]!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFB1A1C6),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            if (index == data.length - 1) ...[
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: Text("LET'S GO!"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF66CCCC),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
