class Provider {
  int id;
  String name;
  String email;
  int avatarId;
  Avatar avatar;

  Provider({this.id, this.name, this.email, this.avatarId, this.avatar});

  Provider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatarId = json['avatar_id'];
    avatar =
        json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar_id'] = this.avatarId;
    if (this.avatar != null) {
      data['avatar'] = this.avatar.toJson();
    }
    return data;
  }
}

class Avatar {
  String name;
  String path;
  String url;

  Avatar({this.name, this.path, this.url});

  Avatar.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    path = json['path'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['path'] = this.path;
    data['url'] = this.url;
    return data;
  }
}