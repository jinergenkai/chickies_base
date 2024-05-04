// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountResponseImpl _$$AccountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountResponseImpl(
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      parentAccountId: (json['parentAccountId'] as num).toInt(),
      role: json['role'] as String,
      mylove: json['mylove'] as String,
      address: json['address'] as String?,
      response: json['response'] as String?,
      request: json['request'] as String?,
    );

Map<String, dynamic> _$$AccountResponseImplToJson(
        _$AccountResponseImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate.toIso8601String(),
      'parentAccountId': instance.parentAccountId,
      'role': instance.role,
      'mylove': instance.mylove,
      'address': instance.address,
      'response': instance.response,
      'request': instance.request,
    };
