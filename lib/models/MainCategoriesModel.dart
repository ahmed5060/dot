class MainCategoryItemList {
  List<MainCategoriesModel>? mainCategoryModel;

  MainCategoryItemList({required this.mainCategoryModel});

  factory MainCategoryItemList.fromJson(List<dynamic> json) {
    return MainCategoryItemList(
      mainCategoryModel: json.map((item) => MainCategoriesModel.fromJson(item)).toList(),
    );
  }
}

class MainCategoriesModel {
  MainCategoriesModel({
      this.id, 
      this.name, 
      this.img, 
      this.parentId, 
      this.menu, 
      this.hot, 
      this.most, 
      this.ordered, 
      this.createdAt, 
      this.updatedAt, 
      this.child,});

  MainCategoriesModel.fromJson(dynamic json) {
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
    if (json['child'] != null) {
      child = [];
      json['child'].forEach((v) {
        child?.add(Child.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? img;
  dynamic parentId;
  String? menu;
  String? hot;
  String? most;
  dynamic ordered;
  String? createdAt;
  String? updatedAt;
  List<Child>? child;

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
    if (child != null) {
      map['child'] = child?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Child {
  Child({
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

  Child.fromJson(dynamic json) {
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
  String? name;
  String? img;
  String? parentId;
  String? menu;
  String? hot;
  String? most;
  dynamic ordered;
  String? createdAt;
  String? updatedAt;

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