class ListData {
  List<DataDetail> data;

  ListData({this.data});

    ListData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<DataDetail>();
      json['data'].forEach((v) {
        data.add(new DataDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataDetail {
  String id;
  String name;
  String desc;
  String img;

  DataDetail({this.id, this.name, this.desc, this.img});

  DataDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['img'] = this.img;
    return data;
  }
}