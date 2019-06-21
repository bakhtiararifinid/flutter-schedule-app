import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: AppBarTitle(),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(32),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    DateBox(
                      active: true,
                      date: 17,
                      day: 'Mon',
                      dots: [Colors.yellow, Colors.orange, Colors.green],
                    ),
                    DateBox(
                      date: 18,
                      day: 'Tue',
                      dots: [Colors.yellow, Colors.orange, Colors.green],
                    ),
                    DateBox(
                      date: 19,
                      day: 'Wed',
                      dots: [Colors.yellow, Colors.orange, Colors.green],
                    ),
                  ],
                ),
                Container(
                  height: 8,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'June, 17 ',
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Monday',
              style: Theme.of(context).textTheme.headline.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.navigate_before,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.navigate_next,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

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
    Color color = active ? Colors.white : Theme.of(context).textTheme.display1.color;

    return Container(
      width: 80,
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
