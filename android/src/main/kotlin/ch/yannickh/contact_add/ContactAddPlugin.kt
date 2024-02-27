package ch.yannickh.contact_add

import android.app.Activity
import android.content.ContentValues
import android.content.Intent
import android.provider.ContactsContract
import android.provider.ContactsContract.CommonDataKinds
import android.provider.ContactsContract.CommonDataKinds.Email
import android.provider.ContactsContract.CommonDataKinds.Phone
import android.provider.ContactsContract.CommonDataKinds.StructuredName
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ContactAddPlugin */
class ContactAddPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    private var activity: Activity? = null


    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "contact_add")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }


    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }


    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "addContact" -> result.success(addContact(call.argument("contact")))
            else -> result.notImplemented()
        }
    }

    private fun addContact(contact: Map<String, String>?): Boolean {
        if (contact == null) {
            return false
        }
        if (activity == null) {
            return false
        }

        val data = java.util.ArrayList<ContentValues>()
        if (contact.containsKey("company")) {
            val company = ContentValues()
            company.put(
                ContactsContract.Data.MIMETYPE,
                CommonDataKinds.Organization.CONTENT_ITEM_TYPE
            )
            company.put(CommonDataKinds.Organization.COMPANY, contact["company"])
            data.add(company)
        }
        if (contact.containsKey("email")) {
            val email = ContentValues()
            email.put(ContactsContract.Data.MIMETYPE, Email.CONTENT_ITEM_TYPE)
            email.put(Email.TYPE, Email.TYPE_HOME)
            email.put(Email.ADDRESS, contact["email"])
            data.add(email)
        }

        var fullName: String? = null;
        val name = ContentValues()
        name.put(ContactsContract.Data.MIMETYPE, StructuredName.CONTENT_ITEM_TYPE)
        name.put(StructuredName.RAW_CONTACT_ID, 0)
        if (contact["firstname"] != null && contact["lastname"] != null) {
            fullName = contact["firstname"] + " " + contact["lastname"]
            name.put(StructuredName.DISPLAY_NAME, fullName)
            name.put(StructuredName.GIVEN_NAME, contact["firstname"])
            name.put(StructuredName.FAMILY_NAME, contact["lastname"])
            data.add(name)
        }
        else if(contact["firstname"] != null) {
            fullName = contact["firstname"]
            name.put(StructuredName.DISPLAY_NAME, fullName)
            name.put(StructuredName.DISPLAY_NAME, contact["firstname"])
            name.put(StructuredName.GIVEN_NAME, contact["firstname"])
            data.add(name)
        }

        if (contact.containsKey("phone")) {
            val phone = ContentValues()
            phone.put(ContactsContract.Data.MIMETYPE, Phone.CONTENT_ITEM_TYPE)
            phone.put(Phone.NUMBER, contact["phone"])
            data.add(phone)
        }
        val intent = Intent(Intent.ACTION_INSERT, ContactsContract.Contacts.CONTENT_URI)
        intent.putParcelableArrayListExtra(ContactsContract.Intents.Insert.DATA, data)

        if (fullName != null) {
            intent.putExtra(ContactsContract.Intents.Insert.NAME, fullName)
        }

        activity!!.startActivity(intent)
        return true
    }
}
