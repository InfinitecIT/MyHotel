import 'package:json_annotation/json_annotation.dart';
part 'CheckInGuestReq.g.dart';

@JsonSerializable(includeIfNull: false)
class CheckInGuestReq {
  @JsonKey(name: 'RoomId')
  int? roomId;
  @JsonKey(name: 'GuestName')
  String? guestName;
  @JsonKey(name: 'CheckInDate')
  int? checkInDate;
  @JsonKey(name: 'CheckoutDate')
  int? checkoutDate;

  CheckInGuestReq(this.roomId, this.guestName, this.checkInDate, this.checkoutDate);

  static List<CheckInGuestReq> fromArray(List<dynamic> list) {
    List<CheckInGuestReq> result = [];
    list.forEach((item) {
      result.add(CheckInGuestReq.fromJson(item));
    });
    return result;
  }

  factory CheckInGuestReq.fromJson(Map<String, dynamic> json) => _$CheckInGuestReqFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInGuestReqToJson(this);
}
