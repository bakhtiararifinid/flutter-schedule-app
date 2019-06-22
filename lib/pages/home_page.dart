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
      body: ListView(
        children: <Widget>[
          DateContainer(),
          TagContainer(),
          SchedulesContainer(),
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

class DateContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
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
                dots: [Colors.orange],
              ),
              DateBox(
                date: 20,
                day: 'Thu',
                dots: [Colors.orange, Colors.green],
              ),
            ],
          ),
          Container(
            height: 4,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4)),
          ),
        ],
      ),
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

class TagContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        children: <Widget>[
          Tag(tag: 'Eco', color: Colors.green, textColor: Colors.white),
          Tag(tag: 'GNSi', color: Colors.pink, textColor: Colors.white),
          Tag(tag: 'Fintech'),
          Tag(tag: 'Book'),
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String tag;
  final Color color;
  final Color textColor;

  Tag({
    @required this.tag,
    this.color = Colors.grey,
    this.textColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      margin: EdgeInsets.only(right: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        tag,
        style: TextStyle(color: textColor),
      ),
    );
  }
}

class SchedulesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Schedules ',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '5',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Schedules(),
        ],
      ),
    );
  }
}

class Schedules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Schedule(
            name: 'First meeting about app',
            time: '10:30 am - 11:30 am',
            dotColor: Colors.green,
            active: true,
          ),
          Schedule(
            name: 'Send documents to an accountant',
            time: '05:00 pm - send report',
            dotColor: Colors.green,
            active: false,
          ),
          Schedule(
            name: 'Meeting with investor',
            time: '05:00 pm - 07:30 pm',
            dotColor: Colors.orange,
            active: false,
          ),
        ],
      ),
    );
  }
}

class Schedule extends StatelessWidget {
  final String name;
  final String time;
  final Color dotColor;
  final bool active;

  Schedule({this.name, this.time, this.dotColor, this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: active ? EdgeInsets.only(right: 16) : null,
      decoration: BoxDecoration(
        color: active ? Colors.deepPurple : Colors.transparent,
        borderRadius: active
            ? BorderRadius.horizontal(
                right: Radius.circular(16),
              )
            : null,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.title.copyWith(
                      color: active ? Colors.white : null,
                    ),
              ),
              active
                  ? Icon(
                      Icons.edit,
                      size: 16,
                      color: active ? Colors.white : null,
                    )
                  : Container()
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: <Widget>[
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                ' $time',
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      color: active ? Colors.white : null,
                    ),
              )
            ],
          )
        ],
      ),
    );
  }
}
