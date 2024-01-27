import 'package:flutter/material.dart';

const Color buttonColor = Color.fromRGBO(178, 57, 17, 1);
const Color themeColor = Color.fromRGBO(17, 138, 178, 1);

Widget buildDivider() {
  return const Divider(thickness: 2, color: Colors.grey, height: 50);
}

Widget buildWaitingWidget() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
