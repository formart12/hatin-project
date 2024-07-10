import 'package:flutter/material.dart';
import 'package:hatin/src/widget/hattin_image_icon.dart';

class HatinDialog extends StatelessWidget {
  final List<String> content;
  final String commitLabel;
  final void Function()? onCommit;
  final String cancelLabel;
  final void Function()? onCancel;
  const HatinDialog(
      {super.key,
      this.commitLabel = "확인",
      this.cancelLabel = "취소",
      required this.content,
      this.onCommit,
      this.onCancel})
      : assert(onCommit != null && onCancel != null, "반드시 확인, 취소 액션을 지정해야합니다");

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
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

  Widget _header() => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: HattinImageIcon(path: ImagePath.dialog),
      );

  Widget _content() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            content.length,
            (index) => Text(
              content[index],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
