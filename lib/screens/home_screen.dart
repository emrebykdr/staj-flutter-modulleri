import 'package:flutter/material.dart';
import '../main.dart';
import '../color.dart';
import '../responsive_helper.dart';
import 'video_player_screen.dart';
import 'reels_screen.dart';
import 'notification_screen.dart';
import 'map_screen.dart';
import 'test_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _toggleTheme() {
    if (themeNotifier.value == ThemeMode.dark) {
      themeNotifier.value = ThemeMode.light;
    } else {
      themeNotifier.value = ThemeMode.dark;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final maxWidth = ResponsiveHelper.value<double>(
      context,
      mobile: double.infinity,
      tablet: 600,
      desktop: 800,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Staj Demo'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: isDark ? 'Acik Mod' : 'Karanlik Mod',
            onPressed: _toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _ModuleCard(
                icon: Icons.play_circle,
                title: '1. Video Player Sayfasi',
                subtitle: 'Native + YouTube video oynatma',
                color: AppColors.primary700,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const VideoPlayerScreen()),
                ),
              ),
              _ModuleCard(
                icon: Icons.video_library,
                title: '2. Reels Sayfasi',
                subtitle: 'Instagram Reels tarzi video akisi',
                color: AppColors.accent,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ReelsScreen()),
                ),
              ),
              _ModuleCard(
                icon: Icons.notifications_active,
                title: '3. Bildirim Sistemi',
                subtitle: '5 saniye sonra local notification',
                color: AppColors.primary500,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NotificationScreen()),
                ),
              ),
              _ModuleCard(
                icon: Icons.map,
                title: '4. Google Maps + Konum',
                subtitle: 'Harita ve kullanici konumu',
                color: AppColors.accent700,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MapScreen()),
                ),
              ),
              _ModuleCard(
                icon: Icons.science,
                title: '5. Loading Deneme',
                subtitle: '5sn loading ekrani',
                color: AppColors.success,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TestScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color color;

  const _ModuleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 28, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
