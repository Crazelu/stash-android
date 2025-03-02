import 'dart:convert';

import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String number;

  const Contact({required this.id, required this.firstName, required this.lastName, required this.number});

  factory Contact.fromMap(Map<String, dynamic> data) => Contact(
        id: data['id'] as int,
        firstName: data['firstName'] as String,
        lastName: data['lastName'] as String,
        number: data['number'] as String,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'number': number,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Contact].
  factory Contact.fromJson(String data) {
    return Contact.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Contact] to a JSON string.
  String toJson() => json.encode(toMap());

  Contact copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? number,
  }) {
    return Contact(
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
