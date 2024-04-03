// To parse this JSON data, do
//
//     final account1 = account1FromJson(jsonString);
//     final account2 = account2FromJson(jsonString);

import 'dart:convert';

Account1 account1FromJson(String str) => Account1.fromJson(json.decode(str));

String account1ToJson(Account1 data) => json.encode(data.toJson());

Account2 account2FromJson(String str) => Account2.fromJson(json.decode(str));

String account2ToJson(Account2 data) => json.encode(data.toJson());

class Account1 {
    String username;
    String password;
    String email;
    String firstName;
    String lastName;
    DateTime birthDate;
    int parentAccountId;
    String role;

    Account1({
        required this.username,
        required this.password,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.birthDate,
        required this.parentAccountId,
        required this.role,
    });

    factory Account1.fromJson(Map<String, dynamic> json) => Account1(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        birthDate: DateTime.parse(json["birthDate"]),
        parentAccountId: json["parentAccountId"],
        role: json["role"],
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
    };
}

class Account2 {
    String mylove;
    String address;

    Account2({
        required this.mylove,
        required this.address,
    });

    factory Account2.fromJson(Map<String, dynamic> json) => Account2(
        mylove: json["mylove"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "mylove": mylove,
        "address": address,
    };
}
