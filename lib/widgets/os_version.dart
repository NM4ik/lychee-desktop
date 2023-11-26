import 'package:flutter/material.dart';
import 'package:lychee_desktop/utils/extensions/on_context.dart';

class OSInfoWidget extends StatelessWidget {
  const OSInfoWidget({super.key, this.osInfo});

  final String? osInfo;

  @override
  Widget build(BuildContext context) {
    String value = osInfo ?? 'Unimplemented OSInfo';

    return Text(
      value,
      style: context.tStyle?.light,
    );
  }
}
