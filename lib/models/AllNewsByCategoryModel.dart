class AllNewsByCategoryModel {
  AllNewsByCategoryModel({
      this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total,});

  AllNewsByCategoryModel.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
  int? currentPage;
  List<Data>? data;
  dynamic firstPageUrl;
  int? from;
  int? lastPage;
  dynamic lastPageUrl;
  dynamic nextPageUrl;
  dynamic path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['last_page'] = lastPage;
    map['last_page_url'] = lastPageUrl;
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    map['total'] = total;
    return map;
  }

}

class Data {
  Data({
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
      this.draft,});

  Data.fromJson(dynamic json) {
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
  }
  int? id;
  dynamic head;
  dynamic body;
  dynamic img;
  dynamic categoryId;
  dynamic slider;
  dynamic tags;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic views;
  dynamic draft;

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
    return map;
  }

}