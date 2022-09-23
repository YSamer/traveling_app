import 'package:traveling_app/models/trip.dart';

class Favorites {
  Favorites._internal() {
    init();
  }
  static final Favorites _instance = Favorites._internal();
  factory Favorites() => _instance;

  init() {
    _isFavorited = false;
    _favoritTrips = [];
  }

  late bool _isFavorited;
  late List<Trip> _favoritTrips;

  bool get isFavorited => _isFavorited;
  List<Trip> get favoritTrips => _favoritTrips;

  void setIsFavorited(bool value) {
    _isFavorited = value;
  }

  void addFavoritTrip(Trip trip) {
    if (!_favoritTrips.contains(trip)) {
      _favoritTrips.add(trip);
    }
    print(_favoritTrips.length);
    if (_favoritTrips.isNotEmpty) {
      setIsFavorited(true);
    }
  }

  void removeFavoritTrip(Trip trip) {
    if (_favoritTrips.contains(trip)) {
      _favoritTrips.remove(trip);
    }
    print(_favoritTrips.length);
    if (_favoritTrips.isNotEmpty) {
      setIsFavorited(true);
    }
  }
}
