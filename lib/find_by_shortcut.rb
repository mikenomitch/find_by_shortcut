class ActiveRecord::Base

  # Open the eigenclass of ActiveRecord::Base because we need to alias a static
  # method.
  class << ActiveRecord::Base
    alias_method :f, :find
  end

  def self.method_missing(method, *args)
    if method.to_s.starts_with?("fb")
      remainder = method.to_s[2..-1]
      attribute = self.new.attributes.keys.select{|e| e.starts_with?(remainder)}.first
      if attribute == nil
        super
      else
        new_method = "find_by_" + attribute
        send(new_method.to_s, args)
      end
    else
      super
    end
  end
end

def f (value)
  Rails.application.eager_load!
  ActiveRecord::Base.descendants.each do |klass|
    klass.new.attributes.keys.each do |attribute|
      find_method = "find_by_" + attribute
      if klass.columns_hash[attribute].type.to_s == value.class.to_s.downcase
        item = klass.send(find_method, value)
        if item != nil
          return item
        end
      end
    end
  end
  return nil
end


# class Class
#   def method_missing(method, *args)
#     if method.to_s.starts_with?("fb")
#       remainder = method.to_s[2..-1]
#       attribute = self.new.attributes.keys.select{|e| e.starts_with?(remainder)}.first
#       if attribute == nil
#         super *args
#       else
#         new_method = "find_by_" + attribute
#         send(new_method.to_s, args)
#       end
#     else
#       super *args
#     end
#   end
# end
