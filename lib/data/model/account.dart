// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);
//     final accountRequest = accountRequestFromJson(jsonString);
//     final accountResponse = accountResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'account.freezed.dart';
part 'account.g.dart';

AccountResponse accountFromJson(String str) => AccountResponse.fromJson(json.decode(str));

String accountToJson(AccountResponse data) => json.encode(data.toJson());

AccountResponse accountRequestFromJson(String str) => AccountResponse.fromJson(json.decode(str));

String accountRequestToJson(AccountResponse data) => json.encode(data.toJson());

AccountResponse accountResponseFromJson(String str) => AccountResponse.fromJson(json.decode(str));

String accountResponseToJson(AccountResponse data) => json.encode(data.toJson());

@freezed
class AccountResponse with _$AccountResponse {
    const factory AccountResponse({
        @JsonKey(name: "username")
        required String username,
        @JsonKey(name: "password")
        required String password,
        @JsonKey(name: "email")
        required String email,
        @JsonKey(name: "firstName")
        required String firstName,
        @JsonKey(name: "lastName")
        required String lastName,
        @JsonKey(name: "birthDate")
        required DateTime birthDate,
        @JsonKey(name: "parentAccountId")
        required int parentAccountId,
        @JsonKey(name: "role")
        required String role,
        @JsonKey(name: "mylove")
        required String mylove,
        @JsonKey(name: "address")
        String? address,
        @JsonKey(name: "response")
        String? response,
        @JsonKey(name: "request")
        String? request,
    }) = _AccountResponse;

    factory AccountResponse.fromJson(Map<String, dynamic> json) => _$AccountResponseFromJson(json);
}
