require "ucd/node/base"
require "ucd/node/has_name"
require "ucd/node/has_type"

module UCD
  module Node
    class Relationship < Base

      include HasName
      include HasType

      attr_reader :from

      def from=(value)
        @from = value.to_s
      end

      attr_reader :to

      def to=(value)
        @to = value.to_s
      end

    end
  end
end
