module Concerns::Findable

  def self.find_by_name(name)
    self.all.each do |instance|
      if instance.name == name
        return instance
      end
    end
    nil
  end

  def find_or_create_by_name(name)
      found = find_by_name(name)
      return found ? found : self.create(name)
    end
end
