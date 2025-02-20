import 'dart:convert';

import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? number;

  const ContactModel({this.id, this.firstName, this.lastName, this.number});

  factory ContactModel.fromMap(Map<String, dynamic> data) => ContactModel(
        id: data['id'] as int?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        number: data['number'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'number': number,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ContactModel].
  factory ContactModel.fromJson(String data) {
    return ContactModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ContactModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ContactModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? number,
  }) {
    return ContactModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      number: number ?? this.number,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        number,
      ];
}
