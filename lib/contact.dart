/// Representation of a Contact to add to the OS
class Contact {
  /// First name to prefill in the new contact
  String? firstname;

  /// Last name to prefill in the new contact
  String? lastname;

  /// Company name to prefill in the new contact
  String? company;

  /// Primary phone number to prefill the new contact
  ///
  /// The format is not specified, this can be any string
  String? phone;

  /// The primary E-Mail address to prefill in the new contact
  String? email;

  /// Constructor allows filling all possible properties
  Contact(
      {this.firstname, this.lastname, this.company, this.phone, this.email});

  /// Converts the contact to a map
  ///
  /// This map is used to invoke the corresponding native methods
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
