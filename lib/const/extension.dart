import 'package:flutter/material.dart';

extension Extnum on num {
  Widget get vs => SizedBox(height: toDouble());
  Widget get hs => SizedBox(width: toDouble());
}
