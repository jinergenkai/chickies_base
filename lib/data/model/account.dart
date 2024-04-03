// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);
//     final accountRequest = accountRequestFromJson(jsonString);
//     final accountResponse = accountResponseFromJson(jsonString);

import 'dart:convert';

AccountResponse accountFromJson(String str) => AccountResponse.fromJson(json.decode(str));

String accountToJson(AccountResponse data) => json.encode(data.toJson());

AccountResponse accountRequestFromJson(String str) => AccountResponse.fromJson(json.decode(str));

String accountRequestToJson(AccountResponse data) => json.encode(data.toJson());

AccountResponse accountResponseFromJson(String str) => AccountResponse.fromJson(json.decode(str));

String accountResponseToJson(AccountResponse data) => json.encode(data.toJson());

class AccountResponse {
    String username;
    String password;
    String email;
    String firstName;
    String lastName;
    DateTime birthDate;
    int parentAccountId;
    String role;
    String mylove;
    String? address;
    String? response;
    String? request;

    AccountResponse({
        required this.username,
        required this.password,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.birthDate,
        required this.parentAccountId,
        required this.role,
        required this.mylove,
        this.address,
        this.response,
        this.request,
    });

    factory AccountResponse.fromJson(Map<String, dynamic> json) => AccountResponse(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        birthDate: DateTime.parse(json["birthDate"]),
        parentAccountId: json["parentAccountId"],
        role: json["role"],
        mylove: json["mylove"],
        address: json["address"],
        response: json["response"],
        request: json["request"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "parentAccountId": parentAccountId,
        "role": role,
        "mylove": mylove,
        "address": address,
        "response": response,
        "request": request,
    };
}
