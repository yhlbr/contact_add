import Cocoa
import FlutterMacOS
import ContactsUI
import Contacts

public class Contact: NSObject {

    public static func fromData(data: [String:String?]) -> CNMutableContact {
        let contact = CNMutableContact()
        if let firstname = data["firstname"] as? String {
            contact.givenName = firstname
        }

        if let lastname = data["lastname"] as? String {
            contact.familyName = lastname
        }

        if let company = data["company"] as? String {
            contact.organizationName = company
        }

        if let phone = data["phone"] as? String {
            let phoneNumber = CNPhoneNumber(stringValue: phone)

            // Create a label for the phone number (e.g., Home, Work, Mobile)
            let phoneLabel = CNLabeledValue(label: CNLabelPhoneNumberMain, value: phoneNumber)

            // Add the phone number to the contact
            contact.phoneNumbers = [phoneLabel]
        }

        if let email = data["email"] as? String {
            let emailAddress = CNLabeledValue<NSString>(label: CNLabelHome, value: email as NSString)

            // Add the email address to the contact
            contact.emailAddresses = [emailAddress]
        }

        return contact;
    }

    public static func showNewContact(contact: CNMutableContact) -> Bool {
        let data = try? CNContactVCardSerialization.data(with: [contact])
        let fileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("contact.vcf")
        try? data?.write(to: fileURL)
        NSWorkspace.shared.open(fileURL)
        return true
    }
}
