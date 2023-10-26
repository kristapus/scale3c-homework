// WARNING: File is auto generated. Changes will be overridden.

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppImages {
  completedIcon,
  emailIcon,
  facebookIcon,
  linkedinIcon,
  menuIcon,
  phoneIcon,
  twitterIcon,
  loginImage,
  signupImage,
  userImage,
}

extension ImagesExtension on AppImages {
  String get path {
    switch (this) {
      case AppImages.completedIcon:
        return 'assets/icons/completed_icon.svg';
      case AppImages.emailIcon:
        return 'assets/icons/email_icon.svg';
      case AppImages.facebookIcon:
        return 'assets/icons/facebook_icon.svg';
      case AppImages.linkedinIcon:
        return 'assets/icons/linkedin_icon.svg';
      case AppImages.menuIcon:
        return 'assets/icons/menu_icon.svg';
      case AppImages.phoneIcon:
        return 'assets/icons/phone_icon.svg';
      case AppImages.twitterIcon:
        return 'assets/icons/twitter_icon.svg';
      case AppImages.loginImage:
        return 'assets/images/login_image.png';
      case AppImages.signupImage:
        return 'assets/images/signup_image.png';
      case AppImages.userImage:
        return 'assets/images/user_image.png';
    }
  }

  Widget image({
    double? width,
    double? height,
    Color? color,
    BoxFit? fit,
  }) {
    if (path.endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        width: width,
        height: height,
        colorFilter: color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
        fit: fit ?? BoxFit.contain,
      );
    } else if (path.endsWith('.png')) {
      return Image.asset(
        path,
        width: width,
        height: height,
        color: color,
        fit: fit,
      );
    } else {
      throw Exception('$path asset type is not supported');
    }
  }
}
