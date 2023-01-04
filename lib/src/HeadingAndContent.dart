import 'package:flutter/material.dart';

class HeadingAndContent extends StatelessWidget {
  const HeadingAndContent(
      {Key? key,
      this.width,
      this.height,
      this.color,
      this.boxColor = Colors.orange,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.rowCrossAxisAlignment = CrossAxisAlignment.center,
      this.rowMainAxisAlignment = MainAxisAlignment.start,
      this.borderColor = Colors.grey,
      this.borderRadius,
      this.margin,
      this.padding,
      this.columnPadding = const EdgeInsets.only(left: 28, bottom: 10),
      this.gapBetweenHeadingAndContent = 10,
      required this.row,
      this.column = const <Widget>[],
      this.gradient})
      : super(key: key);
  final double? width;
  final double? height;
  final EdgeInsetsGeometry columnPadding;
  final double? gapBetweenHeadingAndContent;
  final Color boxColor;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  final List<Widget> row;
  final List<Widget> column;

  final Color borderColor;
  final Gradient? gradient;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        margin: margin,
        padding: const EdgeInsets.only(right: 6, top: 6, bottom: 6),
        decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: borderRadius ?? BorderRadius.circular(11),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: showColumnList()));
  }

  List<Widget> showRowList() {
    List<Widget> list = [];
    list.add(Container(
      width: 8,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
          color: boxColor),
    ));
    rowMainAxisAlignment == MainAxisAlignment.start || row.length < 3
        ? list.add(const SizedBox(
            width: 20,
          ))
        : null;
    for (Widget widget in row) {
      list.add(widget);
    }

    return list;
  }

  List<Widget> showColumnList() {
    List<Widget> list = [];
    list.add(Row(
        mainAxisAlignment: rowMainAxisAlignment,
        crossAxisAlignment: rowCrossAxisAlignment,
        children: showRowList()));
    list.add(SizedBox(
      height: gapBetweenHeadingAndContent,
    ));
    for (Widget widget in column) {
      list.add(Padding(
        padding: columnPadding,
        child: widget,
      ));
    }

    return list;
  }
}
