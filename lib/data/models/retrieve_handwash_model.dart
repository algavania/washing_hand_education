import 'dart:convert';

RetrieveHandwashModel retrieveHandwashModelFromJson(String str) => RetrieveHandwashModel.fromJson(json.decode(str));

String retrieveHandwashModelToJson(RetrieveHandwashModel data) => json.encode(data.toJson());

class RetrieveHandwashModel {
  RetrieveHandwashModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data data;
  final String message;
  final int status;

  factory RetrieveHandwashModel.fromJson(Map<String, dynamic> json) => RetrieveHandwashModel(
    data: json["data"] is String ? Data(handwashId: json["data"], handwashName: json["data"]) : Data.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "status": status,
  };
}

class Data {
  Data({
    required this.handwashId,
    required this.handwashName,
  });

  final String handwashId;
  final String handwashName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    handwashId: json["handwash_id"],
    handwashName: json["handwash_name"],
  );

  Map<String, dynamic> toJson() => {
    "handwash_id": handwashId,
    "handwash_name": handwashName,
  };
}
