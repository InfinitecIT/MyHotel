import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'CheckInGuestResp.g.dart';

@JsonSerializable(includeIfNull: false)
class CheckInGuestResp {
  @JsonKey(name: 'Success')
  int? success;
  @JsonKey(name: 'Message')
  String? message;

  CheckInGuestResp(this.success, this.message);

  static List<CheckInGuestResp> fromArray(List<dynamic> list) {
    List<CheckInGuestResp> result = [];
    list.forEach((item) {
      result.add(CheckInGuestResp.fromJson(item));
    });
    return result;
  }

  factory CheckInGuestResp.fromJson(Map<String, dynamic> json) => _$CheckInGuestRespFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInGuestRespToJson(this);
}
