import 'package:json_annotation/json_annotation.dart';

part 'lib/service/user.g.dart';
@JsonSerializable()
class User {
    User();

    String name;
    String email;
    
    factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
}