require "ucd/node/base"
require "ucd/node/has_name"
require "ucd/node/has_type"

module UCD
  module Node
    class Field < Base

      include HasName
      include HasType

      def initialize(attributes={})
        @access = "public"

        super
      end

      attr_reader :static

      def static=(value)
        @static = !!value
      end

      attr_reader :access

      def access=(value)
        @access = value.to_s # TODO: Validate?
      end

    end
  end
end
