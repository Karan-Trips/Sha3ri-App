class BaseResponse<T> {
  final String? code;
  final String? message;
  final T? data;

  BaseResponse({
    this.code,
    this.message,
    this.data,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return BaseResponse<T>(
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = toJsonT(this.data!);
    }
    return data;
  }

  bool get isOk =>
      code != null &&
      code!.isNotEmpty &&
      (code!.toLowerCase() == '1' || code!.toLowerCase() == '2');

  bool get isNotOk => !isOk;
}
