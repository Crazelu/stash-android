package com.devcrazelu.stash

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class MainActivity: FlutterActivity(){

    private val CONTACT_CHANNEL = "com.devcrazelu.stash/contact"


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val database = AppDatabase.getDatabase(this)
        val contactDao = database.contactDao()

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CONTACT_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "insertContact" -> {
                    val firstName = call.argument<String>("firstName")
                    val lastName = call.argument<String>("lastName")
                    val number = call.argument<String>("number")
                    if (firstName != null && lastName != null && number != null) {
                        CoroutineScope(Dispatchers.IO).launch {
                            contactDao.insert(ContactModel(firstName = firstName, lastName = lastName, number = number))
                            result.success("Contact saved")
                        }
                    } else {
                        result.error("INVALID_ARGUMENTS", "Invalid name or number", null)
                    }
                }
                "getContacts" -> {
                    CoroutineScope(Dispatchers.IO).launch {
                        val users = contactDao.getAllContacts()
                        result.success(users.map { mapOf("id" to it.id, "firstName" to it.firstName, "lastName" to it.lastName,"number" to it.number) })
                    }
                }
                "updateContact" -> {
                    val id = call.argument<Int>("id")
                if(id != null){
                    val firstName = call.argument<String>("firstName")
                    val lastName = call.argument<String>("lastName")
                    val number = call.argument<String>("number")
                    if (firstName != null && lastName != null && number != null) {
                        CoroutineScope(Dispatchers.IO).launch {
                            contactDao.update(ContactModel(id = id, firstName = firstName, lastName = lastName, number = number))
                            result.success("Contact Updated")
                        }
                    } else {
                        result.error("INVALID_ARGUMENTS", "Invalid name or number", null)
                    }
                }
                }
                "deleteContact" -> {
                    val id = call.argument<Int>("id")
                    if (id != null) {
                        CoroutineScope(Dispatchers.IO).launch {
                            val user = contactDao.getAllContacts().find { it.id == id }
                            if (user != null) {
                                contactDao.delete(user)
                                result.success("User Deleted")
                            } else {
                                result.error("USER_NOT_FOUND", "User not found", null)
                            }
                        }
                    } else {
                        result.error("INVALID_ARGUMENTS", "Invalid ID", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }
}
