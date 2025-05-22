import 'package:examen_final_carbonell/preferences/preferences.dart';
import 'package:flutter/material.dart';


// Hem de fer el binding perquè ens funcioni el shared_preferences. El main ha de ser async
void main() async {
   WidgetsFlutterBinding.ensureInitialized(); // <- primero aseguramos que hay comunicación
  await Preferences.init();
  runApp(MyApp);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}

