require "ucd/node/relationship"
require "ucd/node/has_name"

module UCD
  module Node
    class ClassRelationship < Relationship

      include HasName

    end
  end
end
