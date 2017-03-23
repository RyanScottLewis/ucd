require "ucd/has_attributes"

module UCD
  module Node
    class Base

      include HasAttributes

      def initialize(attributes={})
        update_attributes(attributes)
      end

      attr_accessor :parent

    end
  end
end
