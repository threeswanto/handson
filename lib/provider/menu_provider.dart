import 'package:dayalima_handson/model/index_data.dart';
import 'package:dayalima_handson/repository/menu_repository.dart';
import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  List<Data> _listData = [];

  List<Data> get listData => _listData;

  void fetchListData(String menu) {
    MenuRepository().doGetList(menu, onSuccess, onError);
  }

  onSuccess(List<Data> dataDetail) {
    _listData = dataDetail;
    notifyListeners();
  }

  onError() {
    print("OnError Fetch");
  }
}