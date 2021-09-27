class Player {
  static const String battleLongRange = "longRangeBattle";
  static const String battleMidRange = "midRangeBattle";
  static const String battleDrive = "driveBattle";

  final String _name;
  final int _rarity;
  final int _longRangeOffense;
  final int _midRangeOffense;
  final int _driveOffense;
  final int _longRangeDefense;
  final int _midRangeDefense;
  final int _driveDefense;

  Player(
      this._name,
      this._rarity,
      this._longRangeOffense,
      this._midRangeOffense,
      this._driveOffense,
      this._longRangeDefense,
      this._midRangeDefense,
      this._driveDefense);

  factory Player.fromJson(dynamic json) {
    return Player(
        json['name'] as String,
        json['rarity'] as int,
        json['o_long'] as int,
        json['o_mid'] as int,
        json['o_drive'] as int,
        json['d_long'] as int,
        json['d_mid'] as int,
        json['d_drive'] as int);
  }
  get name => _name;
  get rarity => _rarity;
  get longRangeOffense => _longRangeOffense;
  get midRangeOffense => _midRangeOffense;
  get driveOffense => _driveOffense;
  get longRangeDefense => _longRangeDefense;
  get midRangeDefense => _midRangeDefense;
  get driveDefense => _driveDefense;

  void display() {
    print(
        "$name - $rarity stars - Offense: $longRangeOffense/$midRangeOffense/$driveOffense - Defense: $longRangeDefense/$midRangeDefense/$driveDefense");
  }

  bool battle(Player opponent, String battleType) {
    final battleMap = {
      battleLongRange: _battleLong,
      battleMidRange: _battleMid,
      battleDrive: _battleDrive
    };

    var battleFunction = battleMap[battleType];
    if (battleFunction != null) {
      return battleFunction(opponent);
    }

    return false;
  }

  bool _battleLong(Player opponent) {
    return longRangeOffense > opponent.longRangeDefense;
  }

  bool _battleMid(Player opponent) {
    return midRangeOffense > opponent.midRangeDefense;
  }

  bool _battleDrive(Player opponent) {
    return driveOffense > opponent.driveDefense;
  }
}
