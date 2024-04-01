class ResponseVO {
  final dynamic success;
  final dynamic message;
  final dynamic data;

  ResponseVO({this.success, this.message, this.data});

  factory ResponseVO.fromJson(Map<String, dynamic> json) {
    return ResponseVO(
      success: json['success'],
      message: json['message'],
      data: json['data']
    );
  }
}