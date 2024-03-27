import 'package:json_annotation/json_annotation.dart';
part 'UpdateCleaningStatusResp.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateCleaningStatusResp {
  @JsonKey(name: 'Success')
  int? success;
  @JsonKey(name: 'Message')
  String? message;

  UpdateCleaningStatusResp(this.success, this.message);

  static List<UpdateCleaningStatusResp> fromArray(List<dynamic> list) {
    List<UpdateCleaningStatusResp> result = [];
    list.forEach((item) {
      result.add(UpdateCleaningStatusResp.fromJson(item));
    });
    return result;
  }

  factory UpdateCleaningStatusResp.fromJson(Map<String, dynamic> json) => _$UpdateCleaningStatusRespFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCleaningStatusRespToJson(this);
}
