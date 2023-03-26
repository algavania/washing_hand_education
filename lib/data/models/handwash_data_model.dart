// To parse this JSON data, do
//
//     final handwashDataModel = handwashDataModelFromJson(jsonString);

import 'dart:convert';

HandwashDataModel handwashDataModelFromJson(String str) => HandwashDataModel.fromJson(json.decode(str));

String handwashDataModelToJson(HandwashDataModel data) => json.encode(data.toJson());

class HandwashDataModel {
  HandwashDataModel({
    this.data,
    this.message,
    this.status,
  });

  final Data? data;
  final String? message;
  final int? status;

  factory HandwashDataModel.fromJson(Map<String, dynamic> json) => HandwashDataModel(
    data: json["data"] is String ? Data(message: json["data"]) : Data.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "status": status,
  };
}

class Data {
  Data({
    this.message,
    this.state,
    this.battery,
    this.updatedAt,
    this.createdAt,
  });

  final String? message;
  final bool? state;
  final int? battery;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
    state: json["state"],
    battery: json["battery"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "state": state,
    "battery": battery,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
  };
}
