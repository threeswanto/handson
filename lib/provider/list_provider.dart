import 'package:dayalima_handson/model/list_data.dart';
import 'package:dayalima_handson/repository/list_repository.dart';
import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  List<DataDetail> _listDetailData = [];

  List<DataDetail> get listDetailData => _listDetailData;

  void fetchListData(String menu) {
    ListRepository().doGetList(menu, onSuccess, onError);
  }

  onSuccess(List<DataDetail> dataDetail) {
    _listDetailData = dataDetail;
    notifyListeners();
  }

  onError() {
    print("OnError Fetch");
  }
}
