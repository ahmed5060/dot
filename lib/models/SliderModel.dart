class SliderItemList {
  List<SliderModel>? sliderModel;

  SliderItemList({required this.sliderModel});

  factory SliderItemList.fromJson(List<dynamic> json) {
    return SliderItemList(
      sliderModel: json.map((item) => SliderModel.fromJson(item)).toList(),
    );
  }
}

class SliderModel {
  SliderModel({
      this.id, 
      this.head, 
      this.body, 
      this.img, 
      this.categoryId, 
      this.slider, 
      this.tags, 
      this.createdAt, 
      this.updatedAt, 
      this.views, 
      this.draft, 
      this.categories,});

  SliderModel.fromJson(dynamic json) {
    id = json['id'];
    head = json['head'];
    body = json['body'];
    img = json['img'];
    categoryId = json['category_id'];
    slider = json['slider'];
    tags = json['tags'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    views = json['views'];
    draft = json['draft'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }
  int? id;
  String? head;
  String? body;
  String? img;
  dynamic categoryId;
  String? slider;
  String? tags;
  String? createdAt;
  String? updatedAt;
  String? views;
  dynamic draft;
  List<Categories>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['head'] = head;
    map['body'] = body;
    map['img'] = img;
    map['category_id'] = categoryId;
    map['slider'] = slider;
    map['tags'] = tags;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['views'] = views;
    map['draft'] = draft;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Categories {
  Categories({
      this.name, 
      this.pivot,});

  Categories.fromJson(dynamic json) {
    name = json['name'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  String? name;
  Pivot? pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }

}

class Pivot {
  Pivot({
      this.postId, 
      this.categoryId,});

  Pivot.fromJson(dynamic json) {
    postId = json['post_id'];
    categoryId = json['category_id'];
  }
  String? postId;
  String? categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['post_id'] = postId;
    map['category_id'] = categoryId;
    return map;
  }

}