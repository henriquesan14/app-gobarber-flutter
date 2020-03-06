class Appointment {
  bool past;
  bool cancelable;
  int id;
  String date;
  Provider provider;

  Appointment({this.past, this.cancelable, this.id, this.date, this.provider});

  Appointment.fromJson(Map<String, dynamic> json) {
    past = json['past'];
    cancelable = json['cancelable'];
    id = json['id'];
    date = json['date'];
    provider = json['provider'] != null
        ? new Provider.fromJson(json['provider'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['past'] = this.past;
    data['cancelable'] = this.cancelable;
    data['id'] = this.id;
    data['date'] = this.date;
    if (this.provider != null) {
      data['provider'] = this.provider.toJson();
    }
    return data;
  }
}

class Provider {
  int id;
  String name;
  Avatar avatar;

  Provider({this.id, this.name, this.avatar});

  Provider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar =
        json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.avatar != null) {
      data['avatar'] = this.avatar.toJson();
    }
    return data;
  }
}

class Avatar {
  String url;
  int id;
  String path;

  Avatar({this.url, this.id, this.path});

  Avatar.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    data['path'] = this.path;
    return data;
  }
}