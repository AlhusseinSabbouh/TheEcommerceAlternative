class CourseModel {
  int? _id;
  int? _hours;
  String? _name, _desc;

  int? get id => this._id;
  int? get hours => this._hours;
  String? get name => this._name;
  String? get desc => this._desc;

  CourseModel(
      {required String? name, required String? desc, required int? hours})
      : this._desc = desc,
        this._name = name,
        this._hours = hours;

  CourseModel.fromJson(Map<String, dynamic> json)
      : this._desc = json['desc'],
        this._hours = json['hours'],
        this._name = json['name'];

  Map<String, dynamic> toJson() {
    return {'name': this._name, 'desc': this._desc, 'hours': this._hours};
  }
}
