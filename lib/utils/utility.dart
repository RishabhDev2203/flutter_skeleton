
import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Utility {
  static final Utility _singleton = Utility._internal();

  factory Utility() {
    return _singleton;
  }
  Utility._internal();

  static void hideLoader(BuildContext context) {
    if (context.loaderOverlay
        .visible /* && context.loaderOverlay.overlayWidgetType == ReconnectingOverlay*/) {
      context.loaderOverlay.hide();
    }
  }

  static void showLoader(BuildContext context) {
    context.loaderOverlay.show();
  }
}