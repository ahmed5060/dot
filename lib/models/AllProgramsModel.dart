class AllProgramsItemList {
  List<AllProgramsModel>? allProgramsModel;

  AllProgramsItemList({required this.allProgramsModel});

  factory AllProgramsItemList.fromJson(List<dynamic> json) {
    return AllProgramsItemList(
      allProgramsModel: json.map((item) => AllProgramsModel.fromJson(item)).toList(),
    );
  }
}

class AllProgramsModel {
  AllProgramsModel({
      this.id, 
      this.name, 
      this.img, 
      this.parentId, 
      this.menu, 
      this.ordered, 
      this.createdAt, 
      this.updatedAt, 
      this.child, 
      this.episodes,});

  AllProgramsModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    parentId = json['parent_id'];
    menu = json['menu'];
    ordered = json['ordered'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['child'] != null) {
      child = [];
      json['child'].forEach((v) {
        child?.add(Child.fromJson(v));
      });
    }
    if (json['episodes'] != null) {
      episodes = [];
      json['episodes'].forEach((v) {
        episodes?.add(Episodes.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? img;
  dynamic parentId;
  String? menu;
  dynamic ordered;
  String? createdAt;
  String? updatedAt;
  List<Child>? child;
  List<Episodes>? episodes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['img'] = img;
    map['parent_id'] = parentId;
    map['menu'] = menu;
    map['ordered'] = ordered;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (child != null) {
      map['child'] = child?.map((v) => v.toJson()).toList();
    }
    if (episodes != null) {
      map['episodes'] = episodes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Episodes {
  Episodes({
      this.id, 
      this.head, 
      this.body, 
      this.video, 
      this.img, 
      this.categoryId, 
      this.slider, 
      this.tags, 
      this.views, 
      this.createdAt, 
      this.updatedAt, 
      this.pivot,});

  Episodes.fromJson(dynamic json) {
    id = json['id'];
    head = json['head'];
    body = json['body'];
    video = json['video'];
    img = json['img'];
    categoryId = json['category_id'];
    slider = json['slider'];
    tags = json['tags'];
    views = json['views'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  int? id;
  String? head;
  String? body;
  dynamic video;
  String? img;
  dynamic categoryId;
  dynamic slider;
  String? tags;
  String? views;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['head'] = head;
    map['body'] = body;
    map['video'] = video;
    map['img'] = img;
    map['category_id'] = categoryId;
    map['slider'] = slider;
    map['tags'] = tags;
    map['views'] = views;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }

}

class Pivot {
  Pivot({
      this.programId, 
      this.episodeId,});

  Pivot.fromJson(dynamic json) {
    programId = json['program_id'];
    episodeId = json['episode_id'];
  }
  String? programId;
  String? episodeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['program_id'] = programId;
    map['episode_id'] = episodeId;
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
      this.ordered, 
      this.createdAt, 
      this.updatedAt,});

  Child.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    parentId = json['parent_id'];
    menu = json['menu'];
    ordered = json['ordered'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? img;
  String? parentId;
  String? menu;
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
    map['ordered'] = ordered;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}