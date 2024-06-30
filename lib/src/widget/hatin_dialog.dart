import 'package:flutter/material.dart';

class HatinDialog extends StatelessWidget {
  final Widget? header;
  final bool showHeader;
  final String content;
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
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
    );
  }

  Widget _header() => (header != null) ? header! : Container();

  Widget _content() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: Center(
            child: Text(
          content,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        )),
      );

  Widget _commitBtn() => InkWell(
        onTap: onCommit,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                commitLabel,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );

  Widget _cancelBtn() => InkWell(
        onTap: onCancel,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                cancelLabel,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );
}
