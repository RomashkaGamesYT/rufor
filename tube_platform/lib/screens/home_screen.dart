import 'package:flutter/material.dart';
import '../models/video.dart';
import '../widgets/video_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.play_circle_fill, color: Colors.red, size: 32),
            SizedBox(width: 8),
            Text('TubePlatform', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.cast), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          const SizedBox(width: 16),
          const CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 14,
            child: Text('T', style: TextStyle(fontSize: 14, color: Colors.white)),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 20),
        itemCount: mockVideos.length,
        itemBuilder: (context, index) {
          return VideoCard(video: mockVideos[index]);
        },
      ),
    );
  }
}
