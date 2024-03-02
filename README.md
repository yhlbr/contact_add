# contact_add

Add contacts to Android, iOS or macOS without additional permissions.
This is done using native views for the user to complete the contact and save it to the address book.

## Usage

To use this plugin, add `contact_add` as a dependency in your pubspec.yaml file:

```bash
flutter pub add contact_add
```


## Example

<?code-excerpt "readme_contact_add.dart (Example)"?>
```dart
final Contact contact = Contact(
  firstname: "John",
  lastname: "Doe",
  company: "ContactAdd",
  phone: "+41 01 234 56 78",
  email: "hello@example.com"
);

final bool success = await ContactAdd.addContact(contact); 
```

## Supported platforms
This library currently supports iOS, macOS and Android.

