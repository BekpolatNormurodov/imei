class AccountModel {
  int? id;
  String? fio;
  String? region;
  String? boshqarma;
  String? lavozim;
  String? unvon;
  AccountModel({
    required this.id,
    required this.fio,
    required this.region,
    required this.boshqarma,
    required this.lavozim,
    required this.unvon,
  });

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fio = json['fio'];
    region = json['region'];
    boshqarma = json['boshqarma'];
    lavozim = json['lavozim'];
    unvon = json['unvon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fio'] = this.fio;
    data['region'] = this.region;
    data['boshqarma'] = this.boshqarma;
    data['lavozim'] = this.lavozim;
    data['unvon'] = this.unvon;
    return data;
  }
}
