module Slugable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect{|x|x.name.downcase.gsub(" ","-") == slug}
    end
  end
end
