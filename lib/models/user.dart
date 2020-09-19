class AppUser {
  String name;
  String email;
  String profileImage;

  AppUser({this.name, this.email, this.profileImage});

  factory AppUser.fromMap(Map<String, dynamic> map){
    return AppUser(
      name: map["name"],
      email: map["email"],
      profileImage: map["profileImage"]
    );
  }

  Map<String, String> toMap(){
    return {
      "name" : name,
      "email" : email,
      "profileImage" : profileImage ?? ""
    };
  }
}