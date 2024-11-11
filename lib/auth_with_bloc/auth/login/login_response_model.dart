class LoginResponseModel {
  LoginResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.accessToken,
    required this.refreshToken,
    required this.livetime,
  });

  final String? accessToken;
  final String? refreshToken;
  final String? livetime;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
      livetime: json["livetime"],
    );
  }

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "livetime": livetime,
      };
}
