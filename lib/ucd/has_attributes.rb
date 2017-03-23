module UCD
  module HasAttributes

    def update_attributes(attributes={})
      attributes.to_h.each { |name, value| send("#{name}=", value) }
    end

  end
end
