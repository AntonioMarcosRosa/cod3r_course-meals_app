import 'package:flutter/material.dart';
import 'package:meals_app/utils/app_routes.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(this.meal, {super.key});

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.mealDetail,
      arguments: meal,
    ).then((result) => print(result));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 8,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('${meal.duration} min')
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(meal.complexityText)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(meal.costText)
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
