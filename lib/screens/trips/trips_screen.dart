import 'package:flutter/material.dart';
import 'package:traveling_app/data/app_data.dart';
import 'package:traveling_app/models/filters.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/trips/components/trip_item.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({
    super.key,
    required this.id,
    required this.title,
  });
  final String id, title;

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  late final List<Trip> filterTrips;

  void _removeTrip(String returnId) {
    setState(() {
      filterTrips.removeWhere((trip) => trip.id == returnId);
    });
  }

  @override
  void initState() {
    Filters filters = Filters();

    filterTrips = Trips_data.where((trip) {
      if (trip.categories.contains(widget.id)) {
        if (filters.isFiltered) {
          if ((trip.isInSummer && filters.isInSammer) ||
              (trip.isInWinter && filters.isInWinter) ||
              (trip.isForFamilies && filters.isForFamily)) {
            return true;
          } else {
            return false;
          }
        } else {
          return true;
        }
      } else {
        return false;
      }
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: filterTrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            id: filterTrips[index].id,
            title: filterTrips[index].title,
            imgUrl: filterTrips[index].imgUrl,
            duration: filterTrips[index].duration,
            tripType: filterTrips[index].tripType,
            season: filterTrips[index].season,
            // removeItem: _removeTrip,
          );
        },
      ),
    );
  }
}
