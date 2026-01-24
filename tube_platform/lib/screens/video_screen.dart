import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../models/video.dart';

class VideoScreen extends StatelessWidget {
  final String videoId;

  const VideoScreen({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    // Find video by ID
    final video = mockVideos.firstWhere(
      (v) => v.id == videoId,
      orElse: () => mockVideos[0],
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Mock Video Player Area
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.black,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      video.thumbnailUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[800]),
                    ),
                    Container(color: Colors.black.withValues(alpha: 0.4)),
                    const Icon(Icons.play_circle_fill, color: Colors.white, size: 64),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video.title,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${video.views} • ${video.uploadDate}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(video.avatarUrl),
                            onBackgroundImageError: (exception, stackTrace) {},
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  video.channelName,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1.2M subscribers',
                                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                          ShadButton(
                            child: const Text('Subscribe'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Actions (Like, Dislike, Share)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildActionChip(Icons.thumb_up_outlined, '12K'),
                            const SizedBox(width: 8),
                            _buildActionChip(Icons.thumb_down_outlined, ''),
                            const SizedBox(width: 8),
                            _buildActionChip(Icons.share_outlined, 'Share'),
                            const SizedBox(width: 8),
                            _buildActionChip(Icons.download_outlined, 'Download'),
                            const SizedBox(width: 8),
                            _buildActionChip(Icons.library_add_outlined, 'Save'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 16),
                      const Text('Comments', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      _buildComment('User123', 'Great video! Very helpful.', '2 hours ago'),
                      _buildComment('FlutterFan', 'Love the dark mode implementation.', '5 hours ago'),
                      _buildComment('DevGuy', 'Can you do a video on Clean Architecture?', '1 day ago'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black),
          if (label.isNotEmpty) ...[
            const SizedBox(width: 6),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
          ],
        ],
      ),
    );
  }
  
  Widget _buildComment(String user, String text, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 16,
            child: Text(user[0], style: const TextStyle(color: Colors.white, fontSize: 12)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(user, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                    const SizedBox(width: 8),
                    Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(text),
              ],
            ),
          ),
          const Icon(Icons.more_vert, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
