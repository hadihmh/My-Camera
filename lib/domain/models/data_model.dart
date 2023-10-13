class DataModel {
  User? apple;
  User? banana;
  User? melon;
  User? peach;

  DataModel({this.apple, this.banana, this.melon, this.peach});

  DataModel.fromJson(Map<String, dynamic> json) {
    apple = json['apple'] != null ? User.fromJson(json['apple']) : null;
    banana = json['banana'] != null ? User.fromJson(json['banana']) : null;
    melon = json['melon'] != null ? User.fromJson(json['melon']) : null;
    peach = json['peach'] != null ? User.fromJson(json['peach']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (apple != null) {
      data['apple'] = apple!.toJson();
    }
    if (banana != null) {
      data['banana'] = banana!.toJson();
    }
    if (melon != null) {
      data['melon'] = melon!.toJson();
    }
    if (peach != null) {
      data['peach'] = peach!.toJson();
    }
    return data;
  }
}

class User {
  int? age;
  String? description;
  List<String>? images;
  int? likeCount;
  String? location;
  String? name;
  List<String>? tags;

  User(
      {this.age,
      this.description,
      this.images,
      this.likeCount,
      this.location,
      this.name,
      this.tags});

  User.fromJson(Map<dynamic, dynamic> json) {
    age = json['age'];
    description = json['description'];
    images = json['images'].cast<String>();
    likeCount = json['likeCount'];
    location = json['location'];
    name = json['name'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['description'] = description;
    data['images'] = images;
    data['likeCount'] = likeCount;
    data['location'] = location;
    data['name'] = name;
    data['tags'] = tags;
    return data;
  }
}
