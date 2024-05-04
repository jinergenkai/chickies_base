// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) {
  return _AccountResponse.fromJson(json);
}

/// @nodoc
mixin _$AccountResponse {
  @JsonKey(name: "username")
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "firstName")
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "lastName")
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "birthDate")
  DateTime get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: "parentAccountId")
  int get parentAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: "mylove")
  String get mylove => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "response")
  String? get response => throw _privateConstructorUsedError;
  @JsonKey(name: "request")
  String? get request => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountResponseCopyWith<AccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountResponseCopyWith<$Res> {
  factory $AccountResponseCopyWith(
          AccountResponse value, $Res Function(AccountResponse) then) =
      _$AccountResponseCopyWithImpl<$Res, AccountResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "username") String username,
      @JsonKey(name: "password") String password,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "firstName") String firstName,
      @JsonKey(name: "lastName") String lastName,
      @JsonKey(name: "birthDate") DateTime birthDate,
      @JsonKey(name: "parentAccountId") int parentAccountId,
      @JsonKey(name: "role") String role,
      @JsonKey(name: "mylove") String mylove,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "response") String? response,
      @JsonKey(name: "request") String? request});
}

/// @nodoc
class _$AccountResponseCopyWithImpl<$Res, $Val extends AccountResponse>
    implements $AccountResponseCopyWith<$Res> {
  _$AccountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? birthDate = null,
    Object? parentAccountId = null,
    Object? role = null,
    Object? mylove = null,
    Object? address = freezed,
    Object? response = freezed,
    Object? request = freezed,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      parentAccountId: null == parentAccountId
          ? _value.parentAccountId
          : parentAccountId // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      mylove: null == mylove
          ? _value.mylove
          : mylove // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountResponseImplCopyWith<$Res>
    implements $AccountResponseCopyWith<$Res> {
  factory _$$AccountResponseImplCopyWith(_$AccountResponseImpl value,
          $Res Function(_$AccountResponseImpl) then) =
      __$$AccountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "username") String username,
      @JsonKey(name: "password") String password,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "firstName") String firstName,
      @JsonKey(name: "lastName") String lastName,
      @JsonKey(name: "birthDate") DateTime birthDate,
      @JsonKey(name: "parentAccountId") int parentAccountId,
      @JsonKey(name: "role") String role,
      @JsonKey(name: "mylove") String mylove,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "response") String? response,
      @JsonKey(name: "request") String? request});
}

/// @nodoc
class __$$AccountResponseImplCopyWithImpl<$Res>
    extends _$AccountResponseCopyWithImpl<$Res, _$AccountResponseImpl>
    implements _$$AccountResponseImplCopyWith<$Res> {
  __$$AccountResponseImplCopyWithImpl(
      _$AccountResponseImpl _value, $Res Function(_$AccountResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? birthDate = null,
    Object? parentAccountId = null,
    Object? role = null,
    Object? mylove = null,
    Object? address = freezed,
    Object? response = freezed,
    Object? request = freezed,
  }) {
    return _then(_$AccountResponseImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      parentAccountId: null == parentAccountId
          ? _value.parentAccountId
          : parentAccountId // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      mylove: null == mylove
          ? _value.mylove
          : mylove // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountResponseImpl implements _AccountResponse {
  const _$AccountResponseImpl(
      {@JsonKey(name: "username") required this.username,
      @JsonKey(name: "password") required this.password,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "firstName") required this.firstName,
      @JsonKey(name: "lastName") required this.lastName,
      @JsonKey(name: "birthDate") required this.birthDate,
      @JsonKey(name: "parentAccountId") required this.parentAccountId,
      @JsonKey(name: "role") required this.role,
      @JsonKey(name: "mylove") required this.mylove,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "response") this.response,
      @JsonKey(name: "request") this.request});

  factory _$AccountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountResponseImplFromJson(json);

  @override
  @JsonKey(name: "username")
  final String username;
  @override
  @JsonKey(name: "password")
  final String password;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "firstName")
  final String firstName;
  @override
  @JsonKey(name: "lastName")
  final String lastName;
  @override
  @JsonKey(name: "birthDate")
  final DateTime birthDate;
  @override
  @JsonKey(name: "parentAccountId")
  final int parentAccountId;
  @override
  @JsonKey(name: "role")
  final String role;
  @override
  @JsonKey(name: "mylove")
  final String mylove;
  @override
  @JsonKey(name: "address")
  final String? address;
  @override
  @JsonKey(name: "response")
  final String? response;
  @override
  @JsonKey(name: "request")
  final String? request;

  @override
  String toString() {
    return 'AccountResponse(username: $username, password: $password, email: $email, firstName: $firstName, lastName: $lastName, birthDate: $birthDate, parentAccountId: $parentAccountId, role: $role, mylove: $mylove, address: $address, response: $response, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountResponseImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.parentAccountId, parentAccountId) ||
                other.parentAccountId == parentAccountId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.mylove, mylove) || other.mylove == mylove) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.request, request) || other.request == request));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      username,
      password,
      email,
      firstName,
      lastName,
      birthDate,
      parentAccountId,
      role,
      mylove,
      address,
      response,
      request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountResponseImplCopyWith<_$AccountResponseImpl> get copyWith =>
      __$$AccountResponseImplCopyWithImpl<_$AccountResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountResponseImplToJson(
      this,
    );
  }
}

abstract class _AccountResponse implements AccountResponse {
  const factory _AccountResponse(
      {@JsonKey(name: "username") required final String username,
      @JsonKey(name: "password") required final String password,
      @JsonKey(name: "email") required final String email,
      @JsonKey(name: "firstName") required final String firstName,
      @JsonKey(name: "lastName") required final String lastName,
      @JsonKey(name: "birthDate") required final DateTime birthDate,
      @JsonKey(name: "parentAccountId") required final int parentAccountId,
      @JsonKey(name: "role") required final String role,
      @JsonKey(name: "mylove") required final String mylove,
      @JsonKey(name: "address") final String? address,
      @JsonKey(name: "response") final String? response,
      @JsonKey(name: "request") final String? request}) = _$AccountResponseImpl;

  factory _AccountResponse.fromJson(Map<String, dynamic> json) =
      _$AccountResponseImpl.fromJson;

  @override
  @JsonKey(name: "username")
  String get username;
  @override
  @JsonKey(name: "password")
  String get password;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "firstName")
  String get firstName;
  @override
  @JsonKey(name: "lastName")
  String get lastName;
  @override
  @JsonKey(name: "birthDate")
  DateTime get birthDate;
  @override
  @JsonKey(name: "parentAccountId")
  int get parentAccountId;
  @override
  @JsonKey(name: "role")
  String get role;
  @override
  @JsonKey(name: "mylove")
  String get mylove;
  @override
  @JsonKey(name: "address")
  String? get address;
  @override
  @JsonKey(name: "response")
  String? get response;
  @override
  @JsonKey(name: "request")
  String? get request;
  @override
  @JsonKey(ignore: true)
  _$$AccountResponseImplCopyWith<_$AccountResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
