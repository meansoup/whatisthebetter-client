class ErrorResponse {
  final int code;
  final String msg;
  final String stackTrace;

  const ErrorResponse({
    required this.code,
    required this.msg,
    required this.stackTrace,
  });

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'msg': msg,
      'stackTrace': stackTrace,
    };
  }

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json['code'],
      msg: json['msg'],
      stackTrace: json['stackTrace'],
    );
  }

  bool isUserNotExist() {
    return code == 4040001;
  }
}