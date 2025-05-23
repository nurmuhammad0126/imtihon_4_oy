import 'package:exam_4/core/constants/app_colors.dart';
import 'package:exam_4/core/constants/app_icons.dart';
import 'package:exam_4/core/constants/app_images.dart';
import 'package:exam_4/core/constants/app_text_style.dart';
import 'package:exam_4/core/constants/app_theme.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  AppIcons get icons => AppIcons();
  AppColors get colors => AppColors();
  AppImages get images => AppImages();
  ThemeData get appTheme => AppThemes.lightTheme;
  AppTextStyle get styles => appTheme.extension<AppTextStyle>()!;
}
