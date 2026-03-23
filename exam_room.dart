import 'package:flutter/material.dart';

class ExamRoomPage extends StatefulWidget {
  final String mode; // Riceve "Oral" o "Written" dal Setup
  ExamRoomPage({required this.mode});

  @override
  _ExamRoomPageState createState() => _ExamRoomPageState();
}

class _ExamRoomPageState extends State<ExamRoomPage> {
  int currentStep = 1;
  String brainySpeech = "Hi! I'm Brainy. Let's start with the first question: What is the main concept of your notes?";
  bool isCorrect = true; // Simulazione per il test

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF7FF),
      appBar: AppBar(
        title: Text("EXAM SESSION", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF917FB3))),
        backgroundColor: Colors.transparent, elevation: 0,
        leading: Icon(Icons.lens, color: Colors.red, size: 12), // Simbolo "Recording"
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // IL ROBOTTINO BRAINY (Icona Animata)
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF66CCCC), width: 4),
                  boxShadow: [BoxShadow(color: Color(0xFF66CCCC).withOpacity(0.3), blurRadius: 20, spreadRadius: 5)],
                ),
                child: Icon(Icons.smart_toy_rounded, size: 80, color: Color(0xFF66CCCC)),
              ),
            ),
            
            SizedBox(height: 30),

            // SOTTOTITOLI (Quello che Brainy dice)
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFE8D5FF).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                brainySpeech,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF917FB3), fontStyle: FontStyle.italic),
              ),
            ),

            Spacer(),

            // INTERFACCIA DINAMICA (ORALE vs SCRITTO)
            widget.mode == "Oral" ? _buildOralUI() : _buildWrittenUI(),
            
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // UI PER INTERROGAZIONE ORALE (Tasto Microfono)
  Widget _buildOralUI() {
    return Column(
      children: [
        Text("Hold to speak", style: TextStyle(color: Colors.grey)),
        SizedBox(height: 15),
        GestureDetector(
          onLongPress: () => print("Listening..."),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFF66CCCC),
            child: Icon(Icons.mic, size: 40, color: Colors.white),
          ),
        ),
      ],
    );
  }

  // UI PER VERIFICA SCRITTA (Casella di testo)
  Widget _buildWrittenUI() {
    return Column(
      children: [
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: "Type your answer here...",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Logica di correzione e passaggio alla domanda successiva
            setState(() {
              brainySpeech = "Perfect! Now I'll start with the next question.";
            });
          },
          child: Text("SUBMIT ANSWER"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFE5F1), foregroundColor: Color(0xFF917FB3),
            minimumSize: Size(double.infinity, 55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}
