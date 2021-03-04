import 'package:dayalima_handson/model/index_data.dart';
import 'package:dayalima_handson/repository/menu_repository.dart';
import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  List<Data> _listData = [];
  bool _isLoading = false;

  List<Data> get listData => _listData;
  bool get isLoading => _isLoading;

  void fetchListData(String menu) {
    MenuRepository().doGetList(menu, onLoading, onSuccess, onError);
  }

  onLoading() {
    _listData = [];
    _isLoading = true;
  }

  onSuccess(List<Data> dataDetail) {
    _listData = dataDetail;
    _isLoading = false;
    notifyListeners();
  }

  onError() {
    print("OnError Fetch");
    _isLoading = false;
    _listData = [];
    notifyListeners();
  }
}