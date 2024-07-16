class UrgentItemList {
  List<UrgentModel>? urgentModel;

  UrgentItemList({required this.urgentModel});

  factory UrgentItemList.fromJson(List<dynamic> json) {
    return UrgentItemList(
      urgentModel: json.map((item) => UrgentModel.fromJson(item)).toList(),
    );
  }
}

class UrgentModel {
  UrgentModel({
      this.id, 
      this.head, 
      this.categoryId, 
      this.category,});

  UrgentModel.fromJson(dynamic json) {
    id = json['id'];
    head = json['head'];
    categoryId = json['category_id'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  int? id;
  dynamic head;
  dynamic categoryId;
  Category? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['head'] = head;
    map['category_id'] = categoryId;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }

}

class Category {
  Category({
      this.id, 
      this.name, 
      this.img, 
      this.parentId, 
      this.menu, 
      this.hot, 
      this.most, 
      this.ordered, 
      this.createdAt, 
      this.updatedAt,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    parentId = json['parent_id'];
    menu = json['menu'];
    hot = json['hot'];
    most = json['most'];
    ordered = json['ordered'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  dynamic name;
  dynamic img;
  dynamic parentId;
  dynamic menu;
  dynamic hot;
  dynamic most;
  dynamic ordered;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['img'] = img;
    map['parent_id'] = parentId;
    map['menu'] = menu;
    map['hot'] = hot;
    map['most'] = most;
    map['ordered'] = ordered;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}