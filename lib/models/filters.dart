class Filters {
  Filters._internal() {
    init();
  }
  static final Filters _instance = Filters._internal();
  factory Filters() => _instance;

  init() {
    _isFiltered = false;
    _isInSammer = false;
    _isInWinter = false;
    _isForFamily = false;
  }

  late bool _isFiltered;
  late bool _isInSammer;
  late bool _isInWinter;
  late bool _isForFamily;

  bool get isFiltered => _isFiltered;
  bool get isInSammer => _isInSammer;
  bool get isInWinter => _isInWinter;
  bool get isForFamily => _isForFamily;

  void setIsFiltered(bool value) {
    _isFiltered = value;
  }

  void setIsInSammer(bool value) {
    _isInSammer = value;
    if (_isForFamily || _isInSammer || _isInWinter) {
      setIsFiltered(true);
    } else {
      setIsFiltered(false);
    }
  }

  void setIsInWinter(bool value) {
    _isInWinter = value;
    if (_isForFamily || _isInSammer || _isInWinter) {
      setIsFiltered(true);
    } else {
      setIsFiltered(false);
    }
  }

  void setIsForFamily(bool value) {
    _isForFamily = value;
    if (_isForFamily || _isInSammer || _isInWinter) {
      setIsFiltered(true);
    } else {
      setIsFiltered(false);
    }
  }
}
