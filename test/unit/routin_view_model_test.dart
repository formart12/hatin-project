import 'package:flutter_test/flutter_test.dart';
import 'package:hatin/src/repository/routin_repository.dart';
import 'package:hatin/src/service/routin_service.dart';
import 'package:hatin/src/ui/routine/routin_view_model.dart';

void main() {
  group("Routin View Model Unit Test", () {
    test("initial App View Model Status 테스트", () {
      final viewModel = RoutinViewModel(
          routinService: RoutinService(routinRepository: RoutinRepository()));

      expect(viewModel.routins.length, 0);
      expect(viewModel.isEdit, false);
    });

    test("fetchData 테스트", () async {
      final viewModel = RoutinViewModel(
          routinService: RoutinService(routinRepository: RoutinRepository()));

      expect(viewModel.isLoading, true);
      await Future.delayed(const Duration(seconds: 2));
      expect(viewModel.isLoading, false);
      expect(viewModel.routins.length, greaterThan(0));
    });

    test("routin all select 테스트", () async {
      final viewModel = RoutinViewModel(
          routinService: RoutinService(routinRepository: RoutinRepository()));
      await Future.delayed(const Duration(seconds: 1));
      for (var routin in viewModel.routins) {
        expect(routin.isCheck, false);
      }
      viewModel.allSelect();
      for (var routin in viewModel.routins) {
        expect(routin.isCheck, true);
      }
    });

    test("routin select 테스트", () async {
      final viewModel = RoutinViewModel(
          routinService: RoutinService(routinRepository: RoutinRepository()));
      await Future.delayed(const Duration(seconds: 1));
      for (var routin in viewModel.routins) {
        expect(routin.isCheck, false);
      }
      viewModel.check(true, 3);
      expect(viewModel.routins[3].isCheck, true);
    });
  });
}
