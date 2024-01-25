// user.dart
class User {
  String username;
  List<String> rooms;

  User({required this.username, required this.rooms});

  factory User.fromJson(Map<String, dynamic> json) {
    print('Ini dari fromJson $json ');
    print(json['username']);
    print(List<String>.from(json['rooms']));

    return User(
      username: json['username'] ?? '',
      rooms: List<String>.from(json['rooms'] ?? []),
    );//mapping dari json ke sistem, selalu mapping karena dia ada key nya
  }

  Map<String, dynamic> toJson() {
    return {
      'username': this.username,
      'rooms': this.rooms,
    }; // mapping ke json
  }
}
