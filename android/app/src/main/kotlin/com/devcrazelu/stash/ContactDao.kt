package com.devcrazelu.stash

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.Query
import androidx.room.Update

@Dao
interface ContactDao {
    @Insert
     fun insert(contactModel:  ContactModel)

    @Update
     fun update(contactModel: ContactModel)

    @Delete
     fun delete(contactModel: ContactModel)

    @Query("SELECT * FROM contact WHERE number = :number")
     fun fetchContact(number: String): ContactModel

    @Query("SELECT * FROM contact")
    fun getAllContacts(): List<ContactModel>
}