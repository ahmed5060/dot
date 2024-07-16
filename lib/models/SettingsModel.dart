class SettingsModel {
  SettingsModel({
      this.id, 
      this.sliderCount, 
      this.tickerStatus, 
      this.facebook, 
      this.twitter, 
      this.linkedin, 
      this.pinterest, 
      this.instagram, 
      this.livechat, 
      this.address, 
      this.sate, 
      this.vFreq, 
      this.hFreq, 
      this.phone, 
      this.createdAt, 
      this.updatedAt, 
      this.desc, 
      this.youtube,});

  SettingsModel.fromJson(dynamic json) {
    id = json['id'];
    sliderCount = json['slider_count'];
    tickerStatus = json['ticker_status'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    pinterest = json['pinterest'];
    instagram = json['instagram'];
    livechat = json['livechat'];
    address = json['address'];
    sate = json['sate'];
    vFreq = json['v_freq'];
    hFreq = json['h_freq'];
    phone = json['Phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    desc = json['desc'];
    youtube = json['youtube'];
  }
  int? id;
  dynamic sliderCount;
  dynamic tickerStatus;
  dynamic facebook;
  dynamic twitter;
  dynamic linkedin;
  dynamic pinterest;
  dynamic instagram;
  dynamic livechat;
  dynamic address;
  dynamic sate;
  dynamic vFreq;
  dynamic hFreq;
  dynamic phone;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic desc;
  dynamic youtube;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['slider_count'] = sliderCount;
    map['ticker_status'] = tickerStatus;
    map['facebook'] = facebook;
    map['twitter'] = twitter;
    map['linkedin'] = linkedin;
    map['pinterest'] = pinterest;
    map['instagram'] = instagram;
    map['livechat'] = livechat;
    map['address'] = address;
    map['sate'] = sate;
    map['v_freq'] = vFreq;
    map['h_freq'] = hFreq;
    map['Phone'] = phone;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['desc'] = desc;
    map['youtube'] = youtube;
    return map;
  }

}