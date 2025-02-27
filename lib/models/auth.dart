import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Auth {
  final String accessToken;

  const Auth({
    required this.accessToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
    };
  }

  factory Auth.fromMap(Map<String, dynamic> map) {
    return Auth(
      accessToken: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Auth.fromJson(String source) => Auth.fromMap(json.decode(source) as Map<String, dynamic>);
}
