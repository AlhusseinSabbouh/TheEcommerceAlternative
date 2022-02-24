class UserModel {
  String? _name, _email;
  String _userId, _pic = "";

  String get userId => this._userId;
  String? get email => this._email;
  String get pic => this._pic;
  String? get name => this._name;

  UserModel(
      {required String? name,
      required String? email,
      required String userId,
      required String pic})
      : this._email = email,
        this._name = name,
        this._userId = userId,
        this._pic = pic;

  UserModel.fromJson(Map<dynamic, dynamic> map)
      : this._email = map['email'],
        this._name = map["name"],
        this._userId = map["userId"],
        this._pic = map["pic"];

  Map<String, dynamic> toJson() {
    return {
      "userId": this._userId,
      "email": this._email,
      "name": this._name,
      "pic": this._pic
    };
  }
}
