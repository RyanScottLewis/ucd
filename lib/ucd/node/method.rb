require "ucd/node/field"
require "ucd/node/method_argument"
require "ucd/node/has_name"

module UCD
  module Node
    class Method < Field

      include HasName

      attr_reader :abstract

      def abstract=(value)
        @abstract = !!value
      end

      attr_reader :arguments

      def arguments=(value)
        @arguments = value.to_a.map { |attributes| MethodArgument.new(attributes) }
      end

    end
  end
end
