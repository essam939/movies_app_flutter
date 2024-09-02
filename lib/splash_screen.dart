import 'package:flutter/material.dart';
import 'package:movieapp/movies/presentation/screens/movies_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();

    // Navigate to the main screen after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MoviesScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 150.0,
                height: 150.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://cdn3.iconfinder.com/data/icons/redmoon-google/512/google_movies-512.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'MovieFlix', // Replace with your app name
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
