import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Helper: choose readable text color (black or white) against a background
Color contrastTextColor(Color background) {
  return background.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            width: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Row with A, B, C buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    ImageButton(text: "A", image: "assets/img1.png"),
                    ImageButton(text: "B", image: "assets/img4.png"),
                    ImageButton(text: "C", image: "assets/img7.png"),
                  ],
                ),
                const SizedBox(height: 20),

                // Fancy Section
                Column(
                  children: [
                    Text(
                      "Fancy Section",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        ImageNumberBox(number: "1", image: "assets/img2.png"),
                        ImageNumberBox(number: "2", image: "assets/img3.png"),
                        ImageNumberBox(number: "3", image: "assets/img5.png"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        ImageNumberBox(number: "4", image: "assets/img6.png"),
                        ImageNumberBox(number: "5", image: "assets/img8.png"),
                        ImageNumberBox(number: "6", image: "assets/img9.png"),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Info Cards section
                Column(
                  children: [
                    Text(
                      "Info Cards",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        ImageButton(
                          text: "Active",
                          image: "assets/img1.png",
                          number: "23",
                        ),
                        ImageButton(
                          text: "Pending",
                          image: "assets/img4.png",
                          number: "15",
                        ),
                        ImageButton(
                          text: "Completed",
                          image: "assets/img7.png",
                          number: "7",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Button with image background
class ImageButton extends StatelessWidget {
  final String text;
  final String image;
  final String? number;
  const ImageButton({
    super.key,
    required this.text,
    required this.image,
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 6),
        if (number != null)
          Text(
            number!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        Text(text),
      ],
    );
  }
}

// Number box with image
class ImageNumberBox extends StatelessWidget {
  final String number;
  final String image;

  const ImageNumberBox({
    super.key,
    required this.number,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          number,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}