$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))
require "ucd"
require "pathname"
require "pp"

def fixture(path)
  Pathname.new(__FILE__).join("..", "fixtures", path).read.chomp
end

def fixture_example(path)
  Pathname.new(__FILE__).join("..", "..", "examples", path).read.chomp
end

# NOTE: See https://github.com/kschiess/parslet/issues/151
module Parslet
  class ParseFailed < StandardError
    alias_method :parse_failure_cause, :cause

    def cause
      nil
    end
  end
end
