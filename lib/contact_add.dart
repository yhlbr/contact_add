import 'package:flutter/services.dart';

import 'contact.dart';
import 'contact_add_platform_interface.dart';

/// Allows adding a [Contact] to the OS
class ContactAdd {
  /// Adds a [Contact] to the OS
  ///
  /// This method will trigger the native view to display the prefilled contact
  /// It is up to the user to save the contact or cancel
  /// The Future is completed, as soon as the native view is triggered
  /// false is returned, if showing the view failed
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
