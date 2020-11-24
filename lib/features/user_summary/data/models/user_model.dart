class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String website;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.website,
  });

  factory UserModel.fromJSON(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      website: json['website'],
    );
  }
}
