class Details {
  String name;
  String username;
  String email;
  String number;

  Details(this.name, this.username, this.email, this.number);
  Details.json(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    number = json['phone'];
  }
}
