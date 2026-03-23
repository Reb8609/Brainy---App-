import 'package:flutter/material.dart';

class BrainyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BRAINY", style: TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF917FB3), letterSpacing: 2)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Pulsante Interrogazione (Sinistra)
              Expanded(
                child: _bigHomeButton(
                  "ORAL\nEXAM", 
                  Icons.mic_rounded, 
                  Color(0xFFE8D5FF), // Viola Pastello
                  context
                ),
              ),
              SizedBox(width: 20),
              // Pulsante Esercizi (Destra)
              Expanded(
                child: _bigHomeButton(
                  "DAILY\nDRILLS", 
                  Icons.edit_note_rounded, 
                  Color(0xFFFFE5F1), // Rosa Pastello
                  context
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Funzione per creare i due pulsantoni cicciotti
  Widget _bigHomeButton(String title, IconData icon, Color bgColor, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Qui lo manderemo alla pagina di caricamento appunti
      },
      child: Container(
        height: 250, // Molto alto e cicciotto
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(40), // Angoli super arrotondati
          border: Border.all(color: Color(0xFF66CCCC), width: 5), // Bordo Verde Acqua tozzo
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 8))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Color(0xFF66CCCC)),
            SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.w900, 
                color: Color(0xFF917FB3)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
