import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.purple,
              child: Text('T', style: TextStyle(fontSize: 40, color: Colors.white)),
            ),
            const SizedBox(height: 12),
            const Text(
              'Teta User',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('@tetauser • View channel'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: ShadButton.outline(child: const Text('Manage videos'), onPressed: () {})),
                  const SizedBox(width: 12),
                  ShadButton.outline(child: const Icon(Icons.edit), onPressed: () {}),
                  const SizedBox(width: 12),
                  ShadButton.outline(child: const Icon(Icons.bar_chart), onPressed: () {}),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('History'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.playlist_play),
              title: const Text('Playlists'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Your videos'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Your movies'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.watch_later),
              title: const Text('Watch Later'),
              subtitle: const Text('12 unwatched videos'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
