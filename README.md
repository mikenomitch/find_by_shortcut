= find_by_shortcut

A module for faster Active Record queries in the ruby console.

Allows for quick 'find_by_' calls on classes that inherit from ActiveRecord::Base.

Instead of typing "find_by_attribute()" after a Class name, you can type "fb" followed by 
the first character(s) of the attribute you want to search by. If multiple attributes
begin with those the characters following fb, the first will be selected. Do not add any
spaces or underscores after "fb".

An alias "f" for the "find" instance method on ActiveRecord::Base classes is created.

Additionally, a kernel method "f" is added which searches through all ActiveRecord 
objects for an attribute value.


EXAMPLES:

Setup: If User inherits from ActiveRecord::Base, and has the following attributes: "id", 
"username", and "email", you can use find_by_shortcut as follows:

User.f 1
- is the equivalent of User.find(1)


User.fbu "OkinawaSteel"
- is the equivalent of User.find_by_username("OkinawaSteel")


User.fbe "email@isp.com"

User.fbem "email@isp.com"

User.fbemail "email@isp.com"

- are all equivalents of User.find_by_email("email@isp.com")

f "email@isp.com"

- will search through your Active Record classes until it finds something with 'email@isp.com' as one of its attributes (slow on large databases)

== Contributing to find_by_shortcut
 
* Fork the project and do whatever you want.
* Shoot me an email at 'mikenomitch@gmail.com' if you want to discuss.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.

== Copyright

Standard MIT License. See LICENSE.txt for more info (basically, feel free to do 
whatever you want with this).