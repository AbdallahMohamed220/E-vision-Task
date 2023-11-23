import 'package:flutter/widgets.dart';

class VSpace extends StatelessWidget {
  final double space;
  const VSpace(this.space, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}

class HSpace extends StatelessWidget {
  final double space;
  const HSpace(this.space, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}
