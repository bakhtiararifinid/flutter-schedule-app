import 'package:flutter/material.dart';

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