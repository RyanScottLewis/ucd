require "spec_helper"

describe "Examples Integration Test" do

  describe "Composite Example" do

    subject { UCD::Parser.new }
    let(:input) { fixture_example("composite.ucd") }
    let(:output) { fixture_example("composite.dot") }

    it "should parse the input correctly" do
      expect { subject.parse(input) }.not_to raise_error
    end

    it "should format the output correctly" do
      doc = subject.parse(input)
      formatter = UCD::Formatter::Graphviz.new

      expect(formatter.format(doc)).to eq(output)
    end

  end

  describe "Generic Example" do

    subject { UCD::Parser.new }
    let(:input) { fixture_example("generic.ucd") }
    let(:output) { fixture_example("generic.dot") }

    it "should parse the input correctly" do
      expect { subject.parse(input) }.not_to raise_error
    end

    it "should format the output correctly" do
      doc = subject.parse(input)
      formatter = UCD::Formatter::Graphviz.new

      expect(formatter.format(doc)).to eq(output)
    end

  end

end
