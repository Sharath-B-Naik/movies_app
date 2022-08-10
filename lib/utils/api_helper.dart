class Success {
  final String? message;
  final Object data;
  Success({this.message, required this.data});
}

class Failure {
  final String? message;
  final Object? data;
  Failure({this.data, this.message});
}

class ApiResponse {
  final Success? success;
  final Failure? failure;
  ApiResponse({this.success, this.failure});
}
