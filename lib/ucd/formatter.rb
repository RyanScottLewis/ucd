module UCD
  module Formatter
    class << self

      def all
        @all ||= []
      end

      def find_by_name(name)
        name = name.to_sym

        all.find { |formatter_class| formatter_class.name == name }
      end

    end
  end
end

require "ucd/formatter/graphviz"
