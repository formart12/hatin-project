class RoutinRepository {
  Future<List<Map<String, dynamic>>> getRoutins() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        "id": 1,
        "name": "기상",
        "startAt": "07:00",
        "finishAt": "07:00",
      },
      {
        "id": 2,
        "name": "공복 운동",
        "startAt": "07:30",
        "finishAt": "07:30",
      },
      {
        "id": 3,
        "name": "아침 식사",
        "startAt": "09:00",
        "finishAt": "09:00",
      },
      {
        "id": 4,
        "name": "오전 독서",
        "startAt": "10:00",
        "finishAt": "10:00",
      },
      {
        "id": 5,
        "name": "점심 식사",
        "startAt": "12:00",
        "finishAt": "12:00",
      },
      {
        "id": 6,
        "name": "낮잠",
        "startAt": "13:00",
        "finishAt": "13:00",
      },
    ];
  }
}
