import 'package:flutter/material.dart';
import 'setup.dart'; // <--- Questo collegherà la pagina 5 (Configurazione)

class UploadNotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF917FB3)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("UPLOAD NOTES", style: TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF917FB3))),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select your materials", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFB1A1C6))),
            SizedBox(height: 40),
            
            // TASTONE CICCIOTTO PER UPLOAD
            GestureDetector(
              onTap: () {
                // Qui in futuro si aprirà la galleria dell'iPad
              },
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xFFFFE5F1), // Rosa Pastello
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Color(0xFF66CCCC), width: 5), // Verde Acqua
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload_outlined, size: 70, color: Color(0xFF66CCCC)),
                    SizedBox(height: 10),
                    Text("Tap to upload photo or PDF", style: TextStyle(color: Color(0xFF917FB3), fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 50),
            
            // TASTO PER ANDARE ALLA CONFIGURAZIONE
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SetupPage()));
              },
              child: Text("CONFIRM & NEXT", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF66CCCC), // Verde Acqua
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
