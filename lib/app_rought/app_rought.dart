import 'package:flutter/material.dart';

pushToNextPage({required BuildContext context, required Widget className}) {
  return Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => className),
  );
}
