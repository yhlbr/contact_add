// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:contact_add/contact_add.dart';
import 'package:contact_add/contact.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('addContact test', (WidgetTester tester) async {
    final bool addSuccess = await ContactAdd.addContact(Contact(
        firstname: "John",
        lastname: "Doe",
        company: "ContactAdd",
        phone: "+41 01 234 56 78",
        email: "hello@example.com"));
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(addSuccess, true);
  });
}
