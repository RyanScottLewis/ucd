require "ucd/node"
require "ucd/formatter"
require "ucd/has_attributes"

module UCD
  module Formatter
    class Base

      class << self

        def inherited(subclass)
          Formatter.all << subclass
        end

        def format(node, attributes={})
          new(attributes).format(node)
        end

        def name
          to_s.split("::").last.downcase.to_sym
        end

      end

      include HasAttributes

      def initialize(attributes={})
        update_attributes(attributes)
      end

      def name
        self.class.name
      end

      attr_reader :output_path

      def output_path=(value)
        @output_path = value.is_a?(Pathname) ? value : Pathname.new(value.to_s) unless value.nil?
      end

      attr_reader :type

      def type=(value)
        @type = value.to_s.strip.downcase.to_sym
      end

      def format(node)
        case node
        when Node::Field             then format_field(node)
        when Node::Method            then format_method(node)
        when Node::Relationship      then format_relationship(node)
        when Node::ClassRelationship then format_class_relationship(node)
        when Node::ClassNode         then format_class(node)
        when Node::Document          then format_document(node)
        end
      end

      def format_field(node);              raise NotImplementedError; end
      def format_method(node);             raise NotImplementedError; end
      def format_relationship(node);       raise NotImplementedError; end
      def format_class_relationship(node); raise NotImplementedError; end
      def format_class(node);              raise NotImplementedError; end
      def format_document(node);           raise NotImplementedError; end

    end
  end
end
