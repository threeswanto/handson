import 'package:dayalima_handson/base/strings.dart';
import 'package:dayalima_handson/model/list_data.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final DataDetail dataDetail;

  DetailScreen({this.dataDetail});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.TITLE_DETAIL),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                Image.network(widget.dataDetail.img),
                Text(widget.dataDetail.name),
                SizedBox(height: 20),
                Text(widget.dataDetail.desc)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
