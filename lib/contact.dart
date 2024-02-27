class Contact {
  String? firstname;
  String? lastname;
  String? company;
  String? phone;
  String? email;

  Contact(
      {this.firstname,
      this.lastname,
      this.company,
      this.phone,
      this.email});

  Map<String, String?> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'company': company,
      'phone': phone,
      'email': email,
    };
  }
}
