import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // List of message boards with distinct pastel colors and custom names
  final List<Map<String, dynamic>> messageBoards = [
    {
      'name': 'Message Board 1',
      'color': Color(0xFFFFC1D1), // Pastel pink (distinct)
      'number': '1',  // Number for Message Board 1
    },
    {
      'name': 'Message Board 2',
      'color': Color(0xFFB2FF59), // Pastel light green (distinct)
      'number': '2',  // Number for Message Board 2
    },
    {
      'name': 'Message Board 3',
      'color': Color(0xFF80D8FF), // Pastel light blue (distinct)
      'number': '3',  // Number for Message Board 3
    },
    {
      'name': 'Message Board 4',
      'color': Color(0xFFB388FF), // Pastel lavender (distinct)
      'number': '4',  // Number for Message Board 4
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Message Boards',
          style: TextStyle(
            fontSize: 24,             // Font size for the title
            fontWeight: FontWeight.bold,  // Bold title text
            letterSpacing: 1.5,        // Letter spacing for better readability
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Adjust padding
        child: ListView.builder(
          itemCount: messageBoards.length,
          itemBuilder: (context, index) {
            final messageBoard = messageBoards[index];

            return GestureDetector(
              onTap: () {
                // Navigate to the chat page with the board name as an argument
                Navigator.pushNamed(
                  context,
                  '/chat',
                  arguments: messageBoard['name'],
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16.0),  // Spacing between boards
                decoration: BoxDecoration(
                  color: messageBoard['color'], // Pastel background color
                  borderRadius: BorderRadius.circular(15),  // Rounded corners
                ),
                padding: const EdgeInsets.all(20.0),  // Padding inside each board container
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      messageBoard['number'], // Show number inside the board
                      style: const TextStyle(
                        fontSize: 60,         // Larger font size for the number
                        fontWeight: FontWeight.bold,  // Bold number text
                        color: Colors.white,  // White color for number
                      ),
                    ),
                    const SizedBox(height: 12),  // Space between number and text
                    Text(
                      messageBoard['name'],
                      style: const TextStyle(
                        fontSize: 22,      // Larger font size for the name
                        fontWeight: FontWeight.bold,  // Bold text
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
