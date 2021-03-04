import 'package:dayalima_handson/model/list_data.dart';
import 'package:dayalima_handson/repository/list_repository.dart';
import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  List<DataDetail> _listDetailData = [];
  bool _isLoading = false;

  List<DataDetail> get listDetailData => _listDetailData;
  bool get isLoading => _isLoading;

  void fetchListData(String menu) {
    ListRepository().doGetList(menu, onLoading, onSuccess, onError);
  }

  onLoading() {
    _listDetailData = [];
    _isLoading = true;
  }

  onSuccess(List<DataDetail> dataDetail) {
    _listDetailData = dataDetail;
    _isLoading = false;
    notifyListeners();
  }

  onError() {
    print("OnError Fetch");
    _listDetailData = [];
    _isLoading = false;
    notifyListeners();
  }
}
