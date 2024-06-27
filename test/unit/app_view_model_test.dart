import 'package:flutter_test/flutter_test.dart';
import 'package:hatin/src/ui/app/app_view_model.dart';

void main() {
  group("App View Model 테스트", () {
    var appViewModel = AppViewModel();
    test("페이지 인덱스 변경 테스트", () {
      appViewModel.changeIndex(1);
      expect(appViewModel.pageIndex, 1);
      appViewModel.changeIndex(2);
      expect(appViewModel.pageIndex, 2);
      appViewModel.changeIndex(3);
      expect(appViewModel.pageIndex, 3);
      appViewModel.changeIndex(4);
      expect(appViewModel.pageIndex, 4);
    });
  });
}
