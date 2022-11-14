class WordGeneratorModel {
  Slip? slip;

  WordGeneratorModel({this.slip});

  WordGeneratorModel.fromJson(Map<String, dynamic> json) {
    slip = json['slip'] != null ? new Slip.fromJson(json['slip']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slip != null) {
      data['slip'] = this.slip!.toJson();
    }
    return data;
  }
}

class Slip {
  String? slipId;
  String? advice;

  Slip({this.slipId, this.advice});

  Slip.fromJson(Map<String, dynamic> json) {
    slipId = json['slip_id'];
    advice = json['advice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slip_id'] = this.slipId;
    data['advice'] = this.advice;
    return data;
  }
}
