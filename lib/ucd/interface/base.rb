require "optparse"
require "ucd/has_attributes"

module UCD
  module Interface
    class Base

      def self.run(attributes={})
        new(attributes).run
      end

      include HasAttributes

      def initialize(attributes={})
        update_attributes(attributes)
      end

      def run
        raise NotImplementedError
      end

    end
  end
end
