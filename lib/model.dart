class formData {
  String name;
  String role;
  int joining;
  String month;

  formData(
      {required this.name,
      required this.role,
      required this.joining,
      required this.month});

  Map<String, dynamic> tojson() {
    Map<String, dynamic> formdata = <String, dynamic>{};
    formdata['name'] = name;
    formdata['role'] = role;
    formdata['joining'] = joining;
    formdata['month'] = month;
    return formdata;
  }
}
