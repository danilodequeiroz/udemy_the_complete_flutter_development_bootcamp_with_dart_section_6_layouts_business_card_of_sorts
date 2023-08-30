import 'package:flutter/material.dart';

void main() {
  runApp(const BusinessCardApp());
}

class BusinessCardApp extends StatelessWidget {
  const BusinessCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CardMainContent(
        name: 'Danilo de Queiroz',
        imageUrl: "https://avatars.githubusercontent.com/u/6879473",
        role: "Android / Flutter Developer",
        phone: "+44 123 4567 8901",
        email: "angela@email.com",
      ),
    );
  }
}

class CardMainContent extends StatefulWidget {
  const CardMainContent(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.role,
      required this.phone,
      required this.email});

  final String name;
  final String imageUrl;
  final String role;
  final String phone;
  final String email;

  @override
  State<CardMainContent> createState() => _CardMainContentState();
}

class _CardMainContentState extends State<CardMainContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: [
        Colors.teal,
        Colors.teal[200],
      ].first,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/6879473.jpeg",
                  image: widget.imageUrl,
                ),
              ),
            ),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white70,
                fontFamily: "Pacifico",
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              widget.role.toUpperCase(),
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.teal.shade100,
                  fontFamily: "Source Sans 3",
                  fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
