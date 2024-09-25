import 'package:flutter/widgets.dart';

mixin OnActiveMixin<T extends StatefulWidget> on State<T> {
  void onBecomeActive() {}
}