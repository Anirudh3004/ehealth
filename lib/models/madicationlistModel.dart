class madicationlistModel{
  List<Body> body;
  String message;
  String code;
  Null total;

  madicationlistModel({this.body, this.message, this.code, this.total});
  madicationlistModel.fromJson(Map<String, dynamic> json) {
    if (json['body'] != null) {
      body = new List<Body>();
      json['body'].forEach((v) {
        body.add(new Body.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    data['total'] = this.total;
    return data;
  }
}

class Body {
  String medname;
  String medtype;
  String dosage;
  String morning;
  String afternoon;
  String evening;
  String doctor;

  Body(
      {this.medname,
        this.medtype,
        this.dosage,
        this.morning,
        this.afternoon,
        this.evening,
        this.doctor});

  Body.fromJson(Map<String, dynamic> json) {
    medname = json['medname'];
    medtype = json['medtype'];
    dosage = json['dosage'];
    morning = json['morning'];
    afternoon = json['afternoon'];
    evening = json['evening'];
    doctor = json['doctor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medname'] = this.medname;
    data['medtype'] = this.medtype;
    data['dosage'] = this.dosage;
    data['morning'] = this.morning;
    data['afternoon'] = this.afternoon;
    data['evening'] = this.evening;
    data['doctor'] = this.doctor;
    return data;
  }
}