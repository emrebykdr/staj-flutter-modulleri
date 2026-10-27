// demo_card.dart — responsive demo item card
import 'package:flutter/material.dart';
import 'responsive_helper.dart';

class DemoCard extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBg;
  final VoidCallback onTap;

  const DemoCard({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = ResponsiveHelper.value<double>(
      context,
      mobile: 20,
      tablet: 22,
      desktop: 24,
    );
    final iconBox = ResponsiveHelper.value<double>(
      context,
      mobile: 44,
      tablet: 48,
      desktop: 52,
    );
    final titleSize = ResponsiveHelper.value<double>(
      context,
      mobile: 14,
      tablet: 15,
      desktop: 16,
    );
    final subtitleSize = ResponsiveHelper.value<double>(
      context,
      mobile: 12,
      tablet: 12,
      desktop: 13,
    );
    final hPad = ResponsiveHelper.value<double>(
      context,
      mobile: 14,
      tablet: 18,
      desktop: 20,
    );
    final vPad = ResponsiveHelper.value<double>(
      context,
      mobile: 14,
      tablet: 16,
      desktop: 18,
    );
    final radius = ResponsiveHelper.value<double>(
      context,
      mobile: 14,
      tablet: 16,
      desktop: 18,
    );
    final gap = ResponsiveHelper.value<double>(
      context,
      mobile: 12,
      tablet: 14,
      desktop: 16,
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          children: [
            Container(
              width: iconBox,
              height: iconBox,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(radius * 0.7),
              ),
              child: Icon(icon, color: Colors.white, size: iconSize),
            ),
            SizedBox(width: gap),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$index. $title',
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: subtitleSize,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey, size: iconSize),
          ],
        ),
      ),
    );
  }
}
