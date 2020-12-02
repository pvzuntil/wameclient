class KontakReq {
  String name;
  String no;

  KontakReq({this.name, this.no});

  KontakReq.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    no = json['no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['no'] = this.no;
    return data;
  }
}
