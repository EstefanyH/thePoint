import 'package:flutter/widgets.dart';
import 'package:thepointapp/src/msic/widget/dialog.dart';
import 'package:thepointapp/src/route/routeManager.dart';
import 'package:thepointapp/src/util/constant.dart';
import 'package:thepointapp/src/views/page/otpPage.dart';

class OtpViewModel extends State<OtpPage> {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
  void goBackPhoneView() {
    Navigator.popAndPushNamed(context, RouteManager.phonePage);
  }

  void goToRaceView(String code) {
    if (code.isEmpty || code.length != 4) {
      showSnackBar(context, 'Codigo de verificación invalido', gb_duration_showSnackBar);
    } else {
      Navigator.popAndPushNamed(context, RouteManager.mainPage);
    }
  }

}