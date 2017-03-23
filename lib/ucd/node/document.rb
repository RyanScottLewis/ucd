require "ucd/node/base"
require "ucd/node/class_node"

module UCD
  module Node
    class Document < Base

      attr_reader :classes

      def classes=(value)
        @classes = value.to_a.map { |attributes| ClassNode.new(attributes) }
      end

    end
  end
end
