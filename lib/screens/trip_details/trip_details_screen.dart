import 'package:flutter/material.dart';
import 'package:traveling_app/data/app_data.dart';
import 'package:traveling_app/models/favorites.dart';
import 'package:traveling_app/models/trip.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key, required this.id});

  final String id;

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Favorites favorites = Favorites();
    Trip selectedTrip = Trips_data.firstWhere((trip) => trip.id == widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            buildSelectionTitle(context, 'الأنشطة'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            buildSelectionTitle(context, 'البرنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('يوم ${index + 1}'),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            favorites.favoritTrips.contains(selectedTrip)
                ? favorites.removeFavoritTrip(selectedTrip)
                : favorites.addFavoritTrip(selectedTrip);
          });
          // Navigator.of(context).pop(id);
        },
        child: favorites.favoritTrips.contains(selectedTrip)
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
      ),
    );
  }

  Container buildListViewContainer(Widget child) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  Widget buildSelectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
