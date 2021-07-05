// To parse this JSON data, do
//
//     final testData = testDataFromJson(jsonString);

import 'dart:convert';

List<TestData> testDataFromJson(String str) =>
    List<TestData>.from(json.decode(str).map((x) => TestData.fromJson(x)));

String testDataToJson(List<TestData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestData {
  TestData({
    this.id,
    this.name,
    this.email,
    this.age,
    this.laptop,
    this.gender,
    this.v,
    this.testDatumId,
  });

  String id;
  String name;
  String email;
  String age;
  String laptop;
  String gender;
  int v;
  String testDatumId;

  factory TestData.fromJson(Map<String, dynamic> json) => TestData(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        age: json["age"],
        laptop: json["laptop"],
        gender: json["gender"],
        v: json["__v"],
        testDatumId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "age": age,
        "laptop": laptop,
        "gender": gender,
        "__v": v,
        "id": testDatumId,
      };
}
