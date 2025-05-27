import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/extension/size_extensions.dart';

class InfoRowWidget extends StatelessWidget {
  const InfoRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(context.icons.star),
        Text("4.7", style: context.styles.s16w700),
        32.width,

        SvgPicture.asset(context.icons.star),
        Text("Free", style: context.styles.s16w700),
        32.width,

        SvgPicture.asset(context.icons.star),
        Text("20 min", style: context.styles.s16w700),
      ],
    );
  }
}
