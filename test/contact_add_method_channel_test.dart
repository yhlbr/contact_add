import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contact_add/contact_add_method_channel.dart';
import 'package:contact_add/contact.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelContactAdd platform = MethodChannelContactAdd();
  const MethodChannel channel = MethodChannel('contact_add');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return true;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('addContact', () async {
    expect(await platform.addContact(Contact(
        firstname: "John",
        lastname: "Doe",
        company: "ContactAdd",
        phone: "+41 01 234 56 78",
        email: "hello@example.com"
    )), true);
  });
}
