import 'package:dayalima_handson/base/strings.dart';
import 'package:dayalima_handson/provider/list_provider.dart';
import 'package:dayalima_handson/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  final String menu;

  ListScreen({this.menu});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    context.read<ListProvider>().fetchListData(widget.menu);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menu.substring(0, widget.menu.length-5)),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Consumer<ListProvider>(builder: (context, data, child) {
          return data.isLoading
              ? CircularProgressIndicator()
              : data.listDetailData.isNotEmpty
                  ? ListView.builder(
                      itemCount: data.listDetailData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                          dataDetail:
                                              data.listDetailData[index])));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.network(data.listDetailData[index].img,
                                      height: 100),
                                  Text(data.listDetailData[index].name)
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                  : InkWell(
                      onTap: () {
                        context.read<ListProvider>().fetchListData(widget.menu);
                      },
                      child: Text(Strings.Error),
                    );
        }),
      ),
    );
  }
}
