import 'package:flutter/material.dart';

class SetupPage extends StatefulWidget {
  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  int questionCount = 10;
  String difficulty = "Normal";
  String mode = "Oral"; // Oral or Written
  bool isTimerOn = false;
  final TextEditingController _customCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CUSTOMIZE EXAM", style: TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF917FB3))),
        backgroundColor: Colors.transparent, elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Color(0xFF917FB3)), onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView( // Per far scorrere la pagina su iPad
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. SCELTA MODALITÀ (SCRITTO O ORALE)
            _sectionTitle("Exam Mode"),
            Row(
              children: [
                _modeTile("ORAL", Icons.mic, mode == "Oral", () => setState(() => mode = "Oral")),
                SizedBox(width: 15),
                _modeTile("WRITTEN", Icons.edit_note, mode == "Written", () => setState(() => mode = "Written")),
              ],
            ),
            
            SizedBox(height: 30),

            // 2. NUMERO DOMANDE + INPUT MANUALE
            _sectionTitle("How many questions?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [10, 20, 30].map((num) => ChoiceChip(
                label: Text("$num"),
                selected: questionCount == num,
                onSelected: (val) => setState(() => questionCount = num),
                selectedColor: Color(0xFF66CCCC),
              )).toList(),
            ),
            TextField(
              controller: _customCountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Or type a custom number...", hintStyle: TextStyle(fontSize: 14)),
              onChanged: (val) => setState(() => questionCount = int.tryParse(val) ?? questionCount),
            ),

            SizedBox(height: 30),

            // 3. DIFFICOLTÀ
            _sectionTitle("Difficulty"),
            _styledSurface(
              child: Column(
                children: ["Chill", "Normal", "Panic Mode"].map((diff) => RadioListTile(
                  title: Text(diff, style: TextStyle(fontWeight: FontWeight.bold)),
                  value: diff,
                  groupValue: difficulty,
                  activeColor: Color(0xFF66CCCC),
                  onChanged: (val) => setState(() => difficulty = val.toString()),
                )).toList(),
              ),
            ),

            SizedBox(height: 30),

            // 4. TIMER (ON/OFF)
            _styledSurface(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer_outlined, color: Color(0xFF917FB3)),
                      SizedBox(width: 10),
                      Text("Timed Exam", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF917FB3))),
                    ],
                  ),
                  Switch(
                    value: isTimerOn,
                    activeColor: Color(0xFF66CCCC),
                    onChanged: (val) => setState(() => isTimerOn = val),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // TASTO AVVIO
            ElevatedButton(
              onPressed: () { /* Qui partirà l'interrogazione vera */ },
              child: Text("START ${mode.toUpperCase()}!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFE5F1), foregroundColor: Color(0xFF917FB3),
                minimumSize: Size(double.infinity, 70),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Color(0xFF66CCCC), width: 3)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) => Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFB1A1C6)));

  Widget _modeTile(String label, IconData icon, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF66CCCC).withOpacity(0.2) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: isSelected ? Color(0xFF66CCCC) : Colors.grey.shade200, width: 2),
          ),
          child: Column(children: [Icon(icon, color: Color(0xFF66CCCC)), Text(label, style: TextStyle(fontWeight: FontWeight.bold))]),
        ),
      ),
    );
  }

  Widget _styledSurface({required Widget child}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xFFF3E5F5))),
      child: child,
    );
  }
}
