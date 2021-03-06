class Login {
  int code;
  bool status;
  String token;
  int userID;
  String userEmail;

  Login(
      {required this.code,
      required this.status,
      required this.userID,
      required this.userEmail,
      required this.token});

  factory Login.fromJson(Map<String, dynamic> obj) {
    return Login(
        code: int.parse('${obj['code']}'),
        status: obj['status'],
        userID: int.parse('${obj['data']['user']['id']}'),
        token: obj['data']['token'],
        userEmail: obj['data']['user']['email']);
  }
}
