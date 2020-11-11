import 'dart:convert';

EmployeeResponds EmpFromJson(String str) => EmployeeResponds.fromJson(json.decode(str));

String EmpToJson(EmployeeResponds data) => json.encode(data.toJson());

class EmployeeResponds {
  EmployeeResponds({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<Data> data;
  String message;

  factory EmployeeResponds.fromJson(Map<String, dynamic> json) => EmployeeResponds(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message == null ? null : message,
  };
}

class Data {
  Data({
    this.id,
    this.employeeName,
    this.employeeSalary,
    this.employeeAge,
    this.profileImage,
  });

  String id;
  String employeeName;
  String employeeSalary;
  String employeeAge;
  String profileImage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? null : json["id"],
    employeeName: json["employee_name"] == null ? null : json["employee_name"],
    employeeSalary: json["employee_salary"] == null ? null : json["employee_salary"],
    employeeAge: json["employee_age"] == null ? null : json["employee_age"],
    profileImage: json["profile_image"] == null ? null : json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "employee_name": employeeName == null ? null : employeeName,
    "employee_salary": employeeSalary == null ? null : employeeSalary,
    "employee_age": employeeAge == null ? null : employeeAge,
    "profile_image": profileImage == null ? null : profileImage,
  };
}