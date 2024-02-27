
import 'package:flutter/services.dart';

import 'contact.dart';
import 'contact_add_platform_interface.dart';

class ContactAdd {
  static Future<bool> addContact(Contact contact) async {
    bool result;
    try {
        result = await ContactAddPlatform.instance.addContact(contact);
    } on PlatformException {
      return false;
    }

    return result;
  }
}