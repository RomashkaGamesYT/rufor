class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String avatarUrl;
  final String channelName;
  final String views;
  final String duration;
  final String uploadDate;

  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.avatarUrl,
    required this.channelName,
    required this.views,
    required this.duration,
    required this.uploadDate,
  });
}

final List<Video> mockVideos = [
  Video(
    id: '1',
    title: 'Flutter Tutorial for Beginners',
    thumbnailUrl: 'https://picsum.photos/seed/1/640/360',
    avatarUrl: 'https://picsum.photos/seed/avatar1/100/100',
    channelName: 'Flutter Dev',
    views: '1.2M views',
    duration: '12:34',
    uploadDate: '2 days ago',
  ),
  Video(
    id: '2',
    title: 'Building a YouTube Clone',
    thumbnailUrl: 'https://picsum.photos/seed/2/640/360',
    avatarUrl: 'https://picsum.photos/seed/avatar2/100/100',
    channelName: 'Code Master',
    views: '500K views',
    duration: '45:20',
    uploadDate: '1 week ago',
  ),
  Video(
    id: '3',
    title: 'Top 10 Programming Languages 2026',
    thumbnailUrl: 'https://picsum.photos/seed/3/640/360',
    avatarUrl: 'https://picsum.photos/seed/avatar3/100/100',
    channelName: 'Tech Trends',
    views: '2.5M views',
    duration: '10:05',
    uploadDate: '3 days ago',
  ),
  Video(
    id: '4',
    title: 'ASMR Coding',
    thumbnailUrl: 'https://picsum.photos/seed/4/640/360',
    avatarUrl: 'https://picsum.photos/seed/avatar4/100/100',
    channelName: 'Relax Code',
    views: '100K views',
    duration: '1:00:00',
    uploadDate: '1 month ago',
  ),
];
