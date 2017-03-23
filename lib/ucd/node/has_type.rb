module UCD
  module Node

    module HasType

      attr_reader :type

      def type=(value)
        @type = value.to_s
      end

    end

  end
end
