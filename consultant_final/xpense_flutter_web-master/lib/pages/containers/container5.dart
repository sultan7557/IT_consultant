import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:xpense_flutter_web/utils/constants.dart';
import 'package:xpense_flutter_web/widgets/commonContainer.dart';

class Container5 extends StatefulWidget {
  const Container5({Key? key}) : super(key: key);

  @override
  _Container5State createState() => _Container5State();
}

class _Container5State extends State<Container5> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContainer5(),
      desktop: DesktopContainer5(),
    );
  }

  //================ MOBILE ===============

  Widget MobileContainer5() {
    return CommonContainerMobile('Start Now!', 'Worry not \nabout the cost',
        'We believe in \nQuality and \nGood Support', illustration6, false);
  }

  //============== DESKTOP =============

  Widget DesktopContainer5() {
    return CommonContainer('Start Now!', 'Worry not \nabout the cost',
        'We believe in \nQuality and \nGood Support', illustration6, false);
  }
}
