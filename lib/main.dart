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
        email: "danilo@email.com",
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
                child: Image.network(
                  widget.imageUrl,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    /// While the progress is not reched,
                    /// returns a asset instead
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Image.asset("assets/images/6879473.jpeg");
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset("assets/images/6879473.jpeg"),
                ),
              ),
            ),
            Text(
              widget.name,
              style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white70,
                  fontFamily: "Pacifico",
                  fontWeight: FontWeight.bold),
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
            ),
            Container(
              color: Colors.white70,
              child: Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 10.0,),
                  Text(widget.phone),
                ],
              ),
            ),
            Container(
              color: Colors.white70,
              child: Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 10.0,),
                  Text(widget.email),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}

Center circularProgressIndicator(ImageChunkEvent loadingProgress){
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
            loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
}
