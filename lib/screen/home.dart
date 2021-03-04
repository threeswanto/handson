import 'package:dayalima_handson/base/strings.dart';
import 'package:dayalima_handson/provider/menu_provider.dart';
import 'package:dayalima_handson/screen/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String menuInit = "index.json";

  @override
  void initState() {
    context.read<MenuProvider>().fetchListData(menuInit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.APP_NAME),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Consumer<MenuProvider>(builder: (context, menu, child) {
          return menu.isLoading
              ? CircularProgressIndicator()
              : menu.listData.isNotEmpty
                  ? ListView.builder(
                      itemCount: menu.listData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(16),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListScreen(
                                          menu:
                                              menu.listData[index].listData)));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.network(menu.listData[index].img,
                                      height: 100),
                                  Text(menu.listData[index].name)
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                  : InkWell(
                      onTap: () {
                        context.read<MenuProvider>().fetchListData(menuInit);
                      },
                      child: Text(Strings.Error),
                    );
        }),
      ),
    );
  }
}
