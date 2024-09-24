import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taf/notifier/dynamic_fab/dynamic_fab_data.dart';
import 'package:taf/notifier/dynamic_fab/fab_notifier.dart';


///Do not forget to call initFabMixin and pass the FabData
mixin FABMixin<T extends StatefulWidget> on State<T> {
  DynamicFabData? data;

  void initFabMixin(DynamicFabData data) {
    this.data = data;
    this.data!.onPressed = onFabPressed;
  }

  @override
  void initState() {
    if (data != null && data!.isDefault) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) => notifyFab());
    }

    super.initState();
  }

  void notifyFab([FABMixin? mixin]) {
    context.read<FABNotifier>().switchMixin(mixin ?? this);
  }

  void onFabPressed() {}
}
