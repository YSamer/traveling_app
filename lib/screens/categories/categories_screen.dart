import 'package:flutter/material.dart';
import 'package:traveling_app/screens/categories/components/category_item.dart';
import 'package:traveling_app/data/app_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: Categories_data.map((data) => CategoryItem(
          id: data.id, title: data.title, imageUrl: data.imgUrl)).toList(),
    );
  }
}
