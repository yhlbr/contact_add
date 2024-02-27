import Flutter
import UIKit
import ContactsUI
import Contacts

public class ContactAddPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "contact_add", binaryMessenger: registrar.messenger())
        let instance = ContactAddPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "addContact":
            result(self.showContactController(arguments: call.arguments))
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func showContactController(arguments: Any?) -> Bool {
        guard let arguments = arguments as? [String: Any] else {
            return false
        }
        guard let contact = arguments["contact"] as? [String: String] else {
            return false
        }
        let mutableContact = Contact.fromData(data: contact);
        return Contact.showNewContact(contact: mutableContact, delegate: self);
    }


}


extension ContactAddPlugin: CNContactViewControllerDelegate {
    public func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
        viewController.dismiss(animated: true, completion: nil)
    }
}