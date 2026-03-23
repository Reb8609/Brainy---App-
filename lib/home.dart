import 'package:flutter/material.dart';
import 'upload.dart'; // <--- Collega la quarta pagina

class BrainyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BRAINY", style: TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF917FB3)))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Expanded(child: _bigBtn("ORAL\nEXAM", Icons.mic, Color(0xFFE8D5FF), context)),
              SizedBox(width: 20),
              Expanded(child: _bigBtn("DAILY\nDRILLS", Icons.edit, Color(0xFFFFE5F1), context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bigBtn(String title, IconData icon, Color color, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigazione verso la pagina di caricamento
        Navigator.push(context, MaterialPageRoute(builder: (context) => UploadNotesPage()));
      },
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: color, 
          borderRadius: BorderRadius.circular(40), 
          border: Border.all(color: Color(0xFF66CCCC), width: 5)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Color(0xFF66CCCC)),
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF917FB3))),
          ],
        ),
      ),
    );
  }
}

  
