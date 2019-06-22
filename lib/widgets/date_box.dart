import 'package:flutter/material.dart';

class DateBox extends StatelessWidget {
  final int date;
  final String day;
  final bool active;
  final List<Color> dots;

  DateBox({
    @required this.date,
    @required this.day,
    this.active = false,
    this.dots = const <Color>[],
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = active ? Colors.deepPurple[500] : Colors.grey[300];
    Color color =
        active ? Colors.white : Theme.of(context).textTheme.display1.color;

    return Container(
      width: 70,
      height: 110,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            date.toString(),
            style: Theme.of(context).textTheme.display1.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            day,
            style: Theme.of(context).textTheme.title.copyWith(
                  color: color,
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: dots.map((color) {
              return Container(
                height: 8,
                width: 8,
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}