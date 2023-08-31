class AdsItemList {
  List<AdsModel>? adsModel;

  AdsItemList({required this.adsModel});

  factory AdsItemList.fromJson(List<dynamic> json) {
    return AdsItemList(
      adsModel: json.map((item) => AdsModel.fromJson(item)).toList(),
    );
  }
}

class AdsModel {
  AdsModel({
      this.id, 
      this.url, 
      this.img,});

  AdsModel.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    img = json['img'];
  }
  int? id;
  String? url;
  String? img;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['img'] = img;
    return map;
  }

}