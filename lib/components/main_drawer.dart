import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            color: Theme.of(context).colorScheme.primary,
            alignment: Alignment.bottomRight,
            child: const Text(
              "Let's Cook",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          _createItem(
            Icons.restaurant,
            'Meals',
            () => Navigator.of(context).pushReplacementNamed(
              AppRoutes.home,
            ),
          ),
          _createItem(
            Icons.settings,
            'Configuration',
            () => Navigator.of(context).pushReplacementNamed(
              AppRoutes.settings,
            ),
          ),
        ],
      ),
    );
  }
}
