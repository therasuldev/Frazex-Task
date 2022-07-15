import 'package:flutter/material.dart';

import '../../constant/color/app_colors.dart';

class ViewUtils {
  static settingsCard() {
    return BoxDecoration(
      color: AppColors.greyAccent,
      borderRadius: BorderRadius.circular(10),
    );
  }

  static newsCard() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.black, width: .5));
  }

  static cutFromTop(image) {
    return BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(image)));
  }

  static cutFromBottom() {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
    );
  }
}
