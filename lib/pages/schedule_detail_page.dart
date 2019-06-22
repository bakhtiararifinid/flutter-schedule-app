import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/widgets/app_bar_title.dart';
import 'package:schedule_app/widgets/date_box.dart';

class ScheduleDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: AppBarTitle(),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          DateContainer(),
          Members(),
          Files(),
        ],
      ),
    );
  }
}

class DateContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Row(
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
    );
  }
}

class Members extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Members ',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '3',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16),
          Wrap(
            children: <Widget>[
              Member(
                imageUrl:
                    'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_960_720.png',
              ),
              Member(
                imageUrl:
                    'https://cdn.pixabay.com/photo/2017/01/31/19/07/avatar-2026510_960_720.png',
              ),
              Member(
                alias: 'TM',
              ),
              AddMember(),
            ],
          )
        ],
      ),
    );
  }
}

class Member extends StatelessWidget {
  final String alias;
  final String imageUrl;

  Member({this.alias, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.all(4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: imageUrl != null
          ? Image.network(
              imageUrl,
              fit: BoxFit.fill,
            )
          : Text(alias),
    );
  }
}

class AddMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.all(4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(Icons.add),
    );
  }
}

class Files extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Files ',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '2',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[
              File(
                fileName: 'Logotype-eco.ai',
                fileSize: '43,1 MB',
                active: true,
              ),
              File(
                fileName: 'Logotype-eco.ai',
                fileSize: '43,1 MB',
                active: false,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class File extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final bool active;

  File({this.fileName, this.fileSize, this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: active ? Colors.deepPurple[100] : null,
      child: Row(
        children: <Widget>[
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: active ? Colors.white : Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.description,
              color: Colors.deepPurple[300],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  fileName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  fileSize,
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Icon(
              Icons.file_download,
              color: Colors.black38,
            ),
          )
        ],
      ),
    );
  }
}
