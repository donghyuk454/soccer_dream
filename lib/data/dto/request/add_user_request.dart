class AddUserRequest {
  final String email;
  final String name;

  AddUserRequest(this.email, this.name);

  String getEmail() {
    return email;
  }
  String getName() {
    return name;
  }

  Map<String, String> toJson() => {
    'email' : email,
    'name' : name
  };
}