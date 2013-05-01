find_by_shortcut
================

A module for faster Active Record queries in the ruby console.

Allows for quick 'find_by_' calls on classes that inherit from ActiveRecord::Base.

Instead of typing "find_by_attribute()" after a Class name, you can type "fb" followed by 
the first character(s) of the attribute you want to search by. If multiple attributes
begin with those the characters following fb, the first will be selected. Do not add any
spaces or underscores after "fb".


EXAMPLE:
If User inherits from ActiveRecord::Base, and has the following attributes: "id", "username",
and "email", you can use find_by_shortcut as follows:

User.fbi 1
# equivalent of User.find_by_id(1)

User.fbu "OkinawaSteel"
# equivalent of User.find_by_username("OkinawaSteel")

User.fbe "email@isp.com"
User.fbem "email@isp.com"
User.fbemail "email@isp.com"

# All equivalents of User.find_by_email("email@isp.com")
