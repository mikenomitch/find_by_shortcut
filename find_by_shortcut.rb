class ActiveRecord::Base

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
