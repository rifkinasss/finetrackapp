import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'auth/login.dart';
import 'auth/signup.dart';

// Konstanta warna dan gaya
const Color primaryColor = Colors.green;
const Color secondaryColor = Colors.blue;
const Color textColor = Colors.white;
const double buttonPadding = 15.0;
const double buttonFontSize = 18.0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure that Flutter bindings are initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const FineTrackApp());
}

class FineTrackApp extends StatelessWidget {
  const FineTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FineTrack',
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  // Fungsi untuk membuat tombol yang lebih modular
  Widget _buildButton({
    required BuildContext context,
    required String text,
    required Color color,
    required Widget page,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: buttonPadding,
        ),
        textStyle: const TextStyle(fontSize: buttonFontSize),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang
          Positioned.fill(
            child: Image.asset(
              'assets/images/traffic.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Overlay dengan gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),

          // Konten utama
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Judul Aplikasi
                    const Text(
                      'FineTrack',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Deskripsi Aplikasi
                    const Text(
                      'Real-time traffic jam monitor',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),

                    // Tombol Sign Up
                    _buildButton(
                      context: context,
                      text: 'Sign Up',
                      color: primaryColor,
                      page: const SignUpPage(),
                    ),
                    const SizedBox(height: 15),

                    // Tombol Log In
                    _buildButton(
                      context: context,
                      text: 'Log In',
                      color: secondaryColor,
                      page: const LoginPage(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
