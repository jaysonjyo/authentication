class SignUpModelClass {
  SignUpModelClass({
      this.fullName, 
      this.email, 
      this.state, 
      this.city, 
      this.locality, 
      this.password, 
      this.id, 
      this.v,});

  SignUpModelClass.fromJson(dynamic json) {
    fullName = json['fullName'];
    email = json['email'];
    state = json['state'];
    city = json['city'];
    locality = json['locality'];
    password = json['password'];
    id = json['_id'];
    v = json['__v'];
  }
  String? fullName;
  String? email;
  String? state;
  String? city;
  String? locality;
  String? password;
  String? id;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = fullName;
    map['email'] = email;
    map['state'] = state;
    map['city'] = city;
    map['locality'] = locality;
    map['password'] = password;
    map['_id'] = id;
    map['__v'] = v;
    return map;
  }

}