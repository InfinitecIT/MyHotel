import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'CheckOutGuestReq.g.dart';

@JsonSerializable(includeIfNull: false)
class CheckOutGuestReq {
  @JsonKey(name: 'RoomId')
  int? roomId;

  CheckOutGuestReq(this.roomId);

  static List<CheckOutGuestReq> fromArray(List<dynamic> list) {
    List<CheckOutGuestReq> result = [];
    list.forEach((item) {
      result.add(CheckOutGuestReq.fromJson(item));
    });
    return result;
  }

  factory CheckOutGuestReq.fromJson(Map<String, dynamic> json) => _$CheckOutGuestReqFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOutGuestReqToJson(this);
}
