import 'package:json_annotation/json_annotation.dart';
part 'UpdateMaintenanceStatusResp.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateMaintenanceStatusResp {
  @JsonKey(name: 'Success')
  int? success;
  @JsonKey(name: 'Message')
  String? message;

  UpdateMaintenanceStatusResp(this.success, this.message);

  static List<UpdateMaintenanceStatusResp> fromArray(List<dynamic> list) {
    List<UpdateMaintenanceStatusResp> result = [];
    list.forEach((item) {
      result.add(UpdateMaintenanceStatusResp.fromJson(item));
    });
    return result;
  }

  factory UpdateMaintenanceStatusResp.fromJson(Map<String, dynamic> json) => _$UpdateMaintenanceStatusRespFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateMaintenanceStatusRespToJson(this);
}
