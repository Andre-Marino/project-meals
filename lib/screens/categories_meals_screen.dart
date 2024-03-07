import 'package:flutter/material.dart';
import 'package:meals/components/new_item.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meals.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meal;

  const CategoriesMealsScreen(this.meal);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meal.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return NewItem(categoryMeals[index]);
        },
      ),
    );
  }
}
