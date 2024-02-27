import 'package:flutter_test/flutter_test.dart';
import 'package:contact_add/contact.dart';
import 'package:contact_add/contact_add.dart';
import 'package:contact_add/contact_add_platform_interface.dart';
import 'package:contact_add/contact_add_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockContactAddPlatform
    with MockPlatformInterfaceMixin
    implements ContactAddPlatform {

  @override
  Future<bool> addContact(Contact contact) => Future.value(true);
}

void main() {
  final ContactAddPlatform initialPlatform = ContactAddPlatform.instance;

  test('$MethodChannelContactAdd is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelContactAdd>());
  });

  test('getPlatformVersion', () async {
    MockContactAddPlatform fakePlatform = MockContactAddPlatform();
    ContactAddPlatform.instance = fakePlatform;

    expect(await ContactAdd.addContact(Contact(
        firstname: "John",
        lastname: "Doe",
        company: "ContactAdd",
        phone: "+41 01 234 56 78",
        email: "hello@example.com"
    )), true);
  });
}
