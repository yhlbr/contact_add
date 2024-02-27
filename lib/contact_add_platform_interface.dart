import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'contact.dart';
import 'contact_add_method_channel.dart';

abstract class ContactAddPlatform extends PlatformInterface {
  /// Constructs a ContactAddPlatform.
  ContactAddPlatform() : super(token: _token);

  static final Object _token = Object();

  static ContactAddPlatform _instance = MethodChannelContactAdd();

  /// The default instance of [ContactAddPlatform] to use.
  ///
  /// Defaults to [MethodChannelContactAdd].
  static ContactAddPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ContactAddPlatform] when
  /// they register themselves.
  static set instance(ContactAddPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> addContact(Contact contact) {
    throw UnimplementedError('addContact() has not been implemented.');
  }
}
