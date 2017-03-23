require "ucd/node/base"
require "ucd/node/has_name"
require "ucd/node/has_type"

module UCD
  module Node

    class MethodArgument < Base

      include HasName
      include HasType

    end

  end
end
