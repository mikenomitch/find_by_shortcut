# If you want to add code to individual classes, use something like this

# class ClassName
#   def self.method_missing(method, *args)
#     if method.to_s.starts_with?("fb")
#       remainder = method.to_s[2..-1]
#       attribute = User.new.attributes.collect{|e| e[0]}.select{|e| e.starts_with?(remainder)}.first
#       new_method = "find_by_" + attribute
#       send(new_method.to_s, args)
#     else
#       super
#     end
#   end
# end

class Class
  def method_missing(method, *args)
    if method.to_s.starts_with?("fb")
      remainder = method.to_s[2..-1]
      attribute = self.new.attributes.collect{|e| e[0]}.select{|e| e.starts_with?(remainder)}.first
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