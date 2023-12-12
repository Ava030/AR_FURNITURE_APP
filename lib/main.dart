import 'package:flutter/material.dart';
import 'package:ar_furniture_app/home_page.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "#", // Replace with actual apiKey
        appId: "#", // Replace with actual appId
        messagingSenderId: "#", // Replace with actual messagingSenderId
        projectId: "#", // Replace with actual projectId
        storageBucket: "#",
      ),
    );
    runApp(const MyApp());
  } catch (errorMsg, stackTrace) {
    print("Firebase initialization failed");
    print("Error: $errorMsg");
    print("Stack Trace: $stackTrace");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Furniture App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}


