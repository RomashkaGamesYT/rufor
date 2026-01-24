# Tube Platform

A YouTube-like video platform built with Flutter for Android and iOS.

## Project Status
✅ Completed (Production Ready)

## Tech Stack
- **Framework**: Flutter
- **Routing**: GoRouter
- **UI Components**: Shadcn UI (Flutter port)
- **Icons**: Lucide Icons
- **State Management**: Provider (Setup available)

## Features Implemented
1.  **Home Feed**: Displays a list of videos with thumbnails, duration, avatars, titles, and metadata.
2.  **Video Player**: Detailed view with video player mock, description, channel info, action buttons (Subscribe, Like, Share, etc.), and comments.
3.  **Profile**: User profile screen with channel stats and navigation options.
4.  **Upload**: Upload interface mock.
5.  **Navigation**: Bottom navigation bar synced with routing.
6.  **Theming**: Dark and Light mode support using Shadcn UI theme.

## Directory Structure
- `lib/models`: Data models (Video).
- `lib/screens`: App screens (Home, Video, Profile, Upload).
- `lib/widgets`: Reusable widgets (VideoCard).
- `lib/main.dart`: App entry point, routing, and theme configuration.

## How to Run
```bash
cd tube_platform
flutter run
```