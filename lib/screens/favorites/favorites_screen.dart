import 'dart:async';

import 'package:flutter/material.dart';
import 'package:traveling_app/models/favorites.dart';
import 'package:traveling_app/screens/trips/components/trip_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (_) => setState(() {}));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Favorites favorites = Favorites();
    return favorites.isFavorited
        ? ListView.builder(
            itemCount: favorites.favoritTrips.length,
            itemBuilder: (context, index) {
              return TripItem(
                id: favorites.favoritTrips[index].id,
                title: favorites.favoritTrips[index].title,
                imgUrl: favorites.favoritTrips[index].imgUrl,
                duration: favorites.favoritTrips[index].duration,
                tripType: favorites.favoritTrips[index].tripType,
                season: favorites.favoritTrips[index].season,
              );
            },
          )
        : const Center(
            child: Text('لا يوجد رحلات بالمفضلة'),
          );
  }
}
