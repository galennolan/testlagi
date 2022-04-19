class Login2 {
  int code;
  bool status;

  Login2({required this.code, required this.status});

  factory Login2.fromJson(Map obj) {
    return Login2(code: int.parse('${obj['code']}'), status: obj['status']);
  }
}
