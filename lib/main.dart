import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/Screens/Home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((value) => runApp(MyApp()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Test App',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.ubuntu(),
          displayMedium: GoogleFonts.ubuntu(),
          displaySmall: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold
          ),
          headlineLarge: GoogleFonts.ubuntu(),
          headlineMedium: GoogleFonts.ubuntu(),
          headlineSmall: GoogleFonts.ubuntu(),
          titleLarge: GoogleFonts.ubuntu(),
          titleMedium: GoogleFonts.ubuntu(),
          titleSmall: GoogleFonts.ubuntu(),
          labelLarge: GoogleFonts.ubuntu(),
          labelMedium: GoogleFonts.ubuntu(),
          labelSmall: GoogleFonts.ubuntu(),
          bodyLarge: GoogleFonts.ubuntu(),
          bodyMedium: GoogleFonts.ubuntu(),
          bodySmall: GoogleFonts.ubuntu(),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

