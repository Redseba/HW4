import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});  // Constructor

  // This method returns the AppBar widget
  AppBar _buildAppBar(String boardName) {
    return AppBar(
      title: Text(
        boardName,
        style: const TextStyle(
          fontSize: 24,          // Larger font size for the title
          fontWeight: FontWeight.bold,  // Bold text
        ),
      ),
      backgroundColor: Colors.blueAccent,  // Custom AppBar color
    );
  }

  // This method builds the body of the chat page
  Widget _buildBody(String boardName) {
    return Padding(
      padding: const EdgeInsets.all(16.0),  // Padding around the body content
      child: Center(
        child: Text(
          'Messages found in "$boardName" appear here.',
          textAlign: TextAlign.center,  // Center the text
          style: const TextStyle(
            fontSize: 22,             // Increased font size for the message
            fontWeight: FontWeight.w500,  // Medium weight for the text
            fontStyle: FontStyle.italic,  // Italicize the text
            color: Colors.black87,     // Slightly darker text for better readability
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the message board name passed as an argument
    final String boardName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: _buildAppBar(boardName),  // Custom AppBar
      body: _buildBody(boardName),  // Custom body content
    );
  }
}

