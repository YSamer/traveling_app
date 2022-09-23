import 'package:flutter/material.dart';
import 'package:traveling_app/components/colors.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/trip_details/trip_details_screen.dart';

class TripItem extends StatelessWidget {
  const TripItem({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.id,
    // required this.removeItem,
  });

  final String id, title, imgUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  // final Function removeItem;

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
      case Season.Spring:
        return 'ربيع';
      case Season.Summer:
        return 'صيف';
      case Season.Autumn:
        return 'خريف';
      default:
        return 'غير معروف';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف';
      case TripType.Recovery:
        return 'نقاهه';
      case TripType.Activities:
        return 'أنشطة';
      case TripType.Therapy:
        return 'معالجة';
      default:
        return 'غير معروف';
    }
  }

  // Future<void> _navigateAndDisplaySelection(BuildContext context) async {
  //   final returnId = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => TripDetailsScreen(id: id)),
  //   );

  //   if (returnId != null) {
  //     removeItem(returnId);
  //   }
  // }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final returnId = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TripDetailsScreen(id: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _navigateAndDisplaySelection(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.today,
                        color: accentcolor,
                      ),
                      const SizedBox(width: 6),
                      Text('$duration أيام')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.wb_sunny,
                        color: accentcolor,
                      ),
                      const SizedBox(width: 6),
                      Text(seasonText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.family_restroom_rounded,
                        color: accentcolor,
                      ),
                      const SizedBox(width: 6),
                      Text(tripTypeText)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
