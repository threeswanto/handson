import 'dart:convert';

import 'package:dayalima_handson/base/api.dart';
import 'package:dayalima_handson/base/url.dart';
import 'package:dayalima_handson/model/index_data.dart';

class MenuRepository {
  void doGetList(String menu, onLoading, onSuccess, onError) async {
    onLoading();
    try {
      var url = BASE_URL + menu;
      var response = await API(BASE_URL).ioClient.get(
        url,
        headers: API(BASE_URL).getDefaultHeader(),
      );
      IndexData apiResponse = IndexData.fromJson(json.decode(response.body));
      if (apiResponse.data.isNotEmpty) {
        onSuccess(apiResponse.data);
      } else {
        onError();
      }
    } catch (exception) {
      onError();
    }
  }
}