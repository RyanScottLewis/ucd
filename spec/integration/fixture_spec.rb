require "spec_helper"

describe "Fixture Integration Test" do

  describe "Composite Example" do

    subject { UCD::Parser.new }
    let(:input) { fixture_example("composite.ucd") }
    let(:output) { fixture("composite.dot") }

    it "should parse the input correctly" do
      expect { subject.parse(input) }.not_to raise_error
    end

    it "should format the output correctly" do
      doc = subject.parse(input)

      formatter = UCD::Formatter::Graphviz.new
      formatter.edge_attributes["fontname"] = "Bitstream Vera Sans"
      formatter.edge_attributes["fontsize"] = 8
      formatter.node_attributes["fontname"] = "Bitstream Vera Sans"
      formatter.node_attributes["fontsize"] = 8

      expect(formatter.format(doc)).to eq(output)
    end

  end

end
