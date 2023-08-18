import 'package:flutter/material.dart';

class AppBuilderWidget extends StatelessWidget {
  final bool? isColor;
  final int sections;
  const AppBuilderWidget({Key? key, this.isColor, required this.sections})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      print("The width is ${constraints.constrainWidth()}");
      return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
            (constraints.constrainWidth() / sections).floor(),
            (index) => SizedBox(
                  width: 3,
                  height: 1,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: isColor == null
                              ? Colors.white
                              : Color(0xFF8ACCF7))),
                )),
      );
    });
  }
}
