class HistoryList {
  String _total;
  String _date;

  HistoryList(this._total, this._date);
  HistoryList.withId(this._total, this._date);

  String get total => _total;
  String get date => _date;

  set total(String newTotal) {
    this._total = newTotal;
  }

  set date(String newDate) {
    this._date = newDate;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['total'] = _total;
    map['date'] = _date;

    return map;
  }

  HistoryList.fromMapObject(Map<String, dynamic> map) {
    this._total = map['total'];
    this._date = map['date'];
  }
}
