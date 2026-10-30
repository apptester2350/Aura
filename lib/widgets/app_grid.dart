import 'package:flutter/material.dart';

class AppGrid extends StatelessWidget {
  const AppGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return AppGridItem(
          icon: Icons.apps,
          label: 'App $index',
        );
      },
    );
  }
}

class AppGridItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const AppGridItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: Colors.white, size: 32),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}