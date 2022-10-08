import 'package:flutter/material.dart';
import 'package:meals_app/components/main_drawer.dart';

import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  @override
  Widget build(BuildContext context) {
    Widget _createSwith(
      String title,
      String subtitle,
      bool value,
      Function(bool) onChanged,
    ) {
      return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwith(
                  'Without Gluten',
                  'Only meals without gluten',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwith(
                  'Without Lactose',
                  'Only meals without lactose',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwith(
                  'Only vegan',
                  'Only vegans meals',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
                _createSwith(
                  'Without vegatarian',
                  'Only vegetarian meals',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
