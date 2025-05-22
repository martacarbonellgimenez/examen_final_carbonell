import 'package:examen_final_carbonell/preferences/preferences.dart';
import 'package:examen_final_carbonell/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';


// Hem de fer el binding perquè ens funcioni el shared_preferences. El main ha de ser async
void main() async {
   WidgetsFlutterBinding.ensureInitialized(); // <- primero aseguramos que hay comunicación
  await Preferences.init();
  runApp(AppState());
}

// El feim Stateless perquè ja canviarà d'estats amb els providers
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [ChangeNotifierProvider(create: (_) => BookProvider(), lazy: false)],
    child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exam App',
      initialRoute: 'home',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        // 'book': (_) => Book(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
    );
  }
}