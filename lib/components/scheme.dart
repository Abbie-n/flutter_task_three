class Scheme {
  String name;
  String email;
  String username;
  String number;

  Scheme(this.name, this.email, this.username, this.number);
  Scheme.json(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    username = json['username'];
    number = json['phone'];
  }
}
