class Routin {
  final int id;
  final String name;
  final String startAt;
  final String finishAt;
  bool isCheck = false;

  Routin(
      {required this.id,
      required this.name,
      required this.startAt,
      required this.finishAt});

  factory Routin.fromJson(Map<String, dynamic> json) {
    return Routin(
        id: json["id"],
        name: json["name"],
        startAt: json["startAt"],
        finishAt: json["finishAt"]);
  }

  void check(bool value) {
    isCheck = value;
  }
}
