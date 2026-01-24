import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'screens/home_screen.dart';
import 'screens/video_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/upload_screen.dart';

void main() {
  runApp(const TubePlatformApp());
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScaffold(child: HomeScreen()),
    ),
    GoRoute(
      path: '/video/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return VideoScreen(videoId: id);
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const MainScaffold(child: ProfileScreen()),
    ),
    GoRoute(
      path: '/upload',
      builder: (context, state) => const UploadScreen(),
    ),
  ],
);

class TubePlatformApp extends StatelessWidget {
  const TubePlatformApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      title: 'Tube Platform',
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: const ShadZincColorScheme.light(
          primary: Colors.red,
        ),
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadZincColorScheme.dark(
          primary: Colors.red,
        ),
      ),
      routerConfig: _router,
    );
  }
}

class MainScaffold extends StatefulWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        // Shorts (Placeholder)
        break;
      case 2:
        context.push('/upload');
        break;
      case 3:
        // Subscriptions (Placeholder)
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if we are on a route that shows bottom nav
    final String location = GoRouterState.of(context).uri.toString();
    // Update selected index based on location for simple sync
    if (location == '/') _selectedIndex = 0;
    if (location == '/profile') _selectedIndex = 4;

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow_outlined), label: 'Shorts'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline, size: 40), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions_outlined), label: 'Subscriptions'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'You'),
        ],
      ),
    );
  }
}