import 'package:flutter/material.dart';

class HatinDialog extends StatelessWidget {
  final Widget? header;
  final bool showHeader;
  final List<String> content;
  final String commitLabel;
  final void Function()? onCommit;
  final String cancelLabel;
  final void Function()? onCancel;
  const HatinDialog(
      {super.key,
      this.header,
      this.showHeader = false,
      this.commitLabel = "확인",
      this.cancelLabel = "취소",
      required this.content,
      this.onCommit,
      this.onCancel})
      : assert(!showHeader || header != null,
            "헤더 영역을 표시하려면 헤더 위젯이 필요합니다. 헤더 위젯을 지정해주세요."),
        assert(onCommit != null && onCancel != null, "반드시 확인, 취소 액션을 지정해야합니다");

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Container(
        height: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _header(),
            _content(),
            _commitBtn(),
            _cancelBtn(),
          ],
        ),
      ),
    );
  }

  Widget _header() => (header != null)
      ? Padding(padding: const EdgeInsets.all(20.0), child: header!)
      : Container();

  Widget _content() => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              content.length,
              (index) => Text(
                content[index],
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );

  Widget _commitBtn() => InkWell(
        highlightColor: const Color(0xffFFE3D7),
        onTap: onCommit,
        child: Ink(
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xffFE4F28)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                commitLabel,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      );

  Widget _cancelBtn() => InkWell(
        highlightColor: Colors.white.withOpacity(0.8),
        borderRadius:
            const BorderRadius.vertical(bottom: Radius.circular(32.0)),
        onTap: onCancel,
        child: Ink(
          decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(32.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Text(
                cancelLabel,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff111111)),
              ),
            ),
          ),
        ),
      );
}
