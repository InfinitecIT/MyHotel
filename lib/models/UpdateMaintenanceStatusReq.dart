import 'package:json_annotation/json_annotation.dart';
part 'UpdateMaintenanceStatusReq.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateMaintenanceStatusReq {
  @JsonKey(name: 'RoomId')
  int? roomId;
  @JsonKey(name: 'MaintenanceStatus')
  int? maintenanceStatus;

  UpdateMaintenanceStatusReq(this.roomId, this.maintenanceStatus);

  static List<UpdateMaintenanceStatusReq> fromArray(List<dynamic> list) {
    List<UpdateMaintenanceStatusReq> result = [];
    list.forEach((item) {
      result.add(UpdateMaintenanceStatusReq.fromJson(item));
    });
    return result;
  }

  factory UpdateMaintenanceStatusReq.fromJson(Map<String, dynamic> json) => _$UpdateMaintenanceStatusReqFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateMaintenanceStatusReqToJson(this);
}
