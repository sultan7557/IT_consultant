import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:xpense_flutter_web/utils/constants.dart';
import 'package:xpense_flutter_web/widgets/commonContainer.dart';

class Container3 extends StatefulWidget {
  const Container3({Key? key}) : super(key: key);

  @override
  _Container3State createState() => _Container3State();
}

class _Container3State extends State<Container3> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContainer3(),
      desktop: DesktopContainer3(),
    );
  }

  //================ MOBILE ===============

  Widget MobileContainer3() {
    return CommonContainerMobile(
        'ALWAYS ONLINE',
        'Real-time \ndevelopment \nwithout any worries',
        'You have an idea and are not sure how to implement it, contact our team!',
        illustration5,
        false);
  }

  //============== DESKTOP =============

  Widget DesktopContainer3() {
    return CommonContainer(
        'ALWAYS ONLINE',
        'Real-time \ndevelopment \nwithout any worries',
        'You have an idea and are not sure how to implement it, contact our team!',
        illustration5,
        false);
  }
}
