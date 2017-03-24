require "spec_helper"

describe UCD::AttributeParser do

  describe "#integer" do
    subject { described_class.new.integer }

    it "should parse correctly" do
      expect { subject.parse("0") }.not_to raise_error
      expect { subject.parse("1") }.not_to raise_error
      expect { subject.parse("123") }.not_to raise_error
      expect { subject.parse("-1") }.not_to raise_error
      expect { subject.parse("-123") }.not_to raise_error
    end
  end

  describe "#float" do
    subject { described_class.new.float }

    it "should parse correctly" do
      expect { subject.parse("0.0") }.not_to raise_error
      expect { subject.parse("1.2") }.not_to raise_error
      expect { subject.parse("123.34") }.not_to raise_error
      expect { subject.parse("-1.2") }.not_to raise_error
      expect { subject.parse("-123.45") }.not_to raise_error
    end
  end

  describe "#string" do
    subject { described_class.new.string }

    it "should parse correctly" do
      expect { subject.parse(%q{"foo"}) }.not_to raise_error
      expect { subject.parse(%q{'foo'}) }.not_to raise_error
    end
  end

  describe "#parse" do
    subject { described_class.new }

    it "should parse correctly" do
      expect(subject.parse(%q{})).to eq({})
      expect(subject.parse(%q{foo=1})).to eq({ "foo" => 1 })
      expect(subject.parse(%q{foo=1.2})).to eq({ "foo" => 1.2 })
      expect(subject.parse(%q{foo='bar'})).to eq({ "foo" => "bar" })
      expect(subject.parse(%q{foo="bar"})).to eq({ "foo" => "bar" })

      expect(subject.parse(%q{foo="bar",baz="qux"})).to eq({ "foo" => "bar", "baz" => "qux" })
      expect(subject.parse(%q{    foo  =     "bar"  ,    baz  =  "qux"         })).to eq({ "foo" => "bar", "baz" => "qux" })
    end
  end

end
