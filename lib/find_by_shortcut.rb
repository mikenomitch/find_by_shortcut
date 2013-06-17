require "find_by_shortcut/version"

class ActiveRecord::Base

  # Open the eigenclass of ActiveRecord::Base because we need to alias a static
  # method.

  # This would allow you to call Email.f 10
  # Which shouldn't be confused with the 'f' method below.
  class << ActiveRecord::Base
    alias_method :f, :find
  end

  # LOOK INTO PASSING THE ARGS TO SUPER, MAYBE REMOVE thE *???

  def self.method_missing(method, *args)
    if method.to_s.starts_with?("fb")
      # Take all characters after "fb"
      remainder = method.to_s[2..-1]
      # Check if there is an attribute that starts with these chatacters
      attribute = self.new.attributes.keys.select{|e| e.starts_with?(remainder)}.first
      # If not, run the normal 'method missing' method
      if attribute == nil
        super
      else
        # but if so, call find by on that attribute
        new_method = "find_by_" + attribute
        send(new_method.to_s, args)
      end
      # if an unknown method doesn't start with fb, run the normal 'method missing' method
    else
      super
    end
  end
end

# Feel free to comment out the section below if you don't want eager loading on your application, as this will slow it down a little bit.
# This section allows you to call something like "f 'example@email.com'" and it will try to find the right class to match the attribute you just called
# On medium/large databases this will be too slow to be effective

def f (value)
  # Load each class before it is explicitly called
  Rails.application.eager_load!
  # Enumerate through all the classes that inherit from ActiveRecord::Base
  ActiveRecord::Base.descendants.each do |klass|
    # Enumberate through each attribute of each class
    klass.new.attributes.keys.each do |attribute|
      # Call find_by for each attribute with the value that came after 'f'
      find_method = "find_by_" + attribute
      if klass.columns_hash[attribute].type.to_s == value.class.to_s.downcase
        item = klass.send(find_method, value)
        if item != nil
          # If something is found, return it and stop the enumeration
          return item
        end
      end
    end
  end
  # If nothing is found, return nil
  return nil
end