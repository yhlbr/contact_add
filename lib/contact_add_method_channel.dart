import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'contact.dart';
import 'contact_add_platform_interface.dart';

/// An implementation of [ContactAddPlatform] that uses method channels.
class MethodChannelContactAdd extends ContactAddPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('contact_add');

  @override
  Future<bool> addContact(Contact contact) async {
    return await methodChannel
            .invokeMethod<bool>('addContact', {'contact': contact.toMap()}) ??
        false;
  }
}
