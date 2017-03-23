require "ucd/node/base"
require "ucd/node/field"
require "ucd/node/method"
require "ucd/node/relationship"
require "ucd/node/class_relationship"
require "ucd/node/has_name"

module UCD
  module Node
    class ClassNode < Base

      include HasName

      attr_reader :modifier

      def modifier=(value)
        @modifier = value.to_s # TODO: Validate?
      end

      attr_reader :members

      def members=(value)
        @members = value.to_a.map do |member|
          type       = member.to_a[0][0] # TODO: This is dumb
          attributes = member.to_a[0][1]
          attributes[:parent] = self

          case type
          when :field              then Field.new(attributes)
          when :method             then Method.new(attributes)
          when :relationship       then Relationship.new(attributes)
          when :class_relationship then ClassRelationship.new(attributes)
          else # TODO: Raise or something
          end
        end
      end

      def fields
        @members.find_all { |member| member.class == Field }
      end

      def methods
        @members.find_all { |member| member.class == Method }
      end

      def relationships
        @members.find_all { |member| member.class == Relationship }
      end

      def class_relationships
        @members.find_all { |member| member.class == ClassRelationship }
      end

    end
  end
end
