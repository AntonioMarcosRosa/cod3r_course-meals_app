import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

  const MealDetailScreen(this.onToggleFavorite, this.isFavorite, {super.key});

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 350,
      height: 200,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(meal.title),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          _createSectionTitle(context, 'Ingredients'),
          _createSectionContainer(
            ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                }),
          ),
          _createSectionTitle(context, 'Steps'),
          _createSectionContainer(ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text(
                          '${index + 1}',
                        ),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    const Divider(),
                  ],
                );
              }))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          onToggleFavorite(meal);
        }),
        child: Icon(
          isFavorite(meal) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
