import 'package:hatin/src/model/routin.dart';
import 'package:hatin/src/repository/routin_repository.dart';

class RoutinService {
  final RoutinRepository routinRepository;
  RoutinService({required this.routinRepository});

  Future<List<Routin>> getAllRoutins() async {
    final result = await routinRepository.getRoutins();
    return result.map((json) => Routin.fromJson(json)).toList();
  }
}
