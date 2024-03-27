import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'UpdateCleaningStatusReq.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateCleaningStatusReq {
  @JsonKey(name: 'RoomId')
  int? roomId;
  @JsonKey(name: 'CleaningStatus')
  int? cleaningStatus;

  UpdateCleaningStatusReq(this.roomId, this.cleaningStatus);

  static List<UpdateCleaningStatusReq> fromArray(List<dynamic> list) {
    List<UpdateCleaningStatusReq> result = [];
    list.forEach((item) {
      result.add(UpdateCleaningStatusReq.fromJson(item));
    });
    return result;
  }

  factory UpdateCleaningStatusReq.fromJson(Map<String, dynamic> json) => _$UpdateCleaningStatusReqFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCleaningStatusReqToJson(this);
}
