module UCD
  module Node

    module HasName

      attr_reader :name

      def name=(value)
        @name = value.to_s
      end

    end

  end
end
