class SignInModelClass {
  SignInModelClass({
      this.token, 
      this.id, 
      this.fullName, 
      this.email, 
      this.state, 
      this.city, 
      this.locality, 
      this.v,});

  SignInModelClass.fromJson(dynamic json) {
    token = json['token'];
    id = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    state = json['state'];
    city = json['city'];
    locality = json['locality'];
    v = json['__v'];
  }
  String? token;
  String? id;
  String? fullName;
  String? email;
  String? state;
  String? city;
  String? locality;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['_id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    map['state'] = state;
    map['city'] = city;
    map['locality'] = locality;
    map['__v'] = v;
    return map;
  }

}