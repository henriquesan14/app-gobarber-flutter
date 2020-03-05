class Horario {
  String time;
  String value;
  bool available;

  Horario({this.time, this.value, this.available});

  Horario.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    value = json['value'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['value'] = this.value;
    data['available'] = this.available;
    return data;
  }
}
