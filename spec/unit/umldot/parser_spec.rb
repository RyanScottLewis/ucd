require "spec_helper"

describe UCD::Parser do

  describe "#name" do
    subject { described_class.new.name }

    it "should parse correctly" do
      expect { subject.parse("foo") }.not_to raise_error
      expect { subject.parse("Foo") }.not_to raise_error
      expect { subject.parse("Foo-12_34") }.not_to raise_error
    end
  end

  describe "#class_name" do
    subject { described_class.new.class_name }

    it "should parse correctly" do
      expect { subject.parse("Foo") }.not_to raise_error
      expect { subject.parse("Generic(Foo)") }.not_to raise_error
      expect { subject.parse("Scoped::Foo") }.not_to raise_error
      expect { subject.parse("Scoped.Foo") }.not_to raise_error
      expect { subject.parse("Generic(Scoped::Foo)") }.not_to raise_error
      expect { subject.parse("Generic(Scoped.Foo)") }.not_to raise_error
      expect { subject.parse("Scoped::Generic(Scoped::Foo)") }.not_to raise_error
      expect { subject.parse("Scoped.Generic(Scoped.Foo)") }.not_to raise_error
      expect { subject.parse("Scoped::Generic(Scoped.Foo)") }.not_to raise_error
    end
  end

  describe '#field_definition' do
    subject { described_class.new.field_definition }

    it "should parse correctly" do
      expect { subject.parse("field Foo") }.not_to raise_error
      expect { subject.parse("public field Foo") }.not_to raise_error
      expect { subject.parse("protected field Foo") }.not_to raise_error
      expect { subject.parse("private field Foo") }.not_to raise_error
      expect { subject.parse("static field Foo") }.not_to raise_error
      expect { subject.parse("static public field Foo") }.not_to raise_error
      expect { subject.parse("static protected field Foo") }.not_to raise_error
      expect { subject.parse("static private field Foo") }.not_to raise_error
      expect { subject.parse("field Foo : Bar") }.not_to raise_error
      expect { subject.parse("public field Foo : Bar") }.not_to raise_error
      expect { subject.parse("protected field Foo : Bar") }.not_to raise_error
      expect { subject.parse("private field Foo : Bar") }.not_to raise_error
      expect { subject.parse("static field Foo : Bar") }.not_to raise_error
      expect { subject.parse("static public field Foo : Bar") }.not_to raise_error
      expect { subject.parse("static protected field Foo : Bar") }.not_to raise_error
      expect { subject.parse("static private field Foo : Bar") }.not_to raise_error
    end
  end

  describe '#method_definition' do
    subject { described_class.new.method_definition }

    it "should parse correctly" do
      expect { subject.parse("method Foo") }.not_to raise_error
      expect { subject.parse("public method Foo") }.not_to raise_error
      expect { subject.parse("protected method Foo") }.not_to raise_error
      expect { subject.parse("private method Foo") }.not_to raise_error
      expect { subject.parse("static method Foo") }.not_to raise_error
      expect { subject.parse("static public method Foo") }.not_to raise_error
      expect { subject.parse("static protected method Foo") }.not_to raise_error
      expect { subject.parse("static private method Foo") }.not_to raise_error
      expect { subject.parse("abstract method Foo") }.not_to raise_error
      expect { subject.parse("abstract public method Foo") }.not_to raise_error
      expect { subject.parse("abstract protected method Foo") }.not_to raise_error
      expect { subject.parse("abstract private method Foo") }.not_to raise_error
      expect { subject.parse("abstract static method Foo") }.not_to raise_error
      expect { subject.parse("abstract static public method Foo") }.not_to raise_error
      expect { subject.parse("abstract static protected method Foo") }.not_to raise_error
      expect { subject.parse("abstract static private method Foo") }.not_to raise_error
      expect { subject.parse("method Foo : Bar") }.not_to raise_error
      expect { subject.parse("public method Foo : Bar") }.not_to raise_error
      expect { subject.parse("protected method Foo : Bar") }.not_to raise_error
      expect { subject.parse("private method Foo : Bar") }.not_to raise_error
      expect { subject.parse("static method Foo : Bar") }.not_to raise_error
      expect { subject.parse("static public method Foo : Bar") }.not_to raise_error
      expect { subject.parse("static protected method Foo : Bar") }.not_to raise_error
      expect { subject.parse("static private method Foo : Bar") }.not_to raise_error
      expect { subject.parse("abstract method Foo : Bar") }.not_to raise_error
      expect { subject.parse("abstract public method Foo : Bar") }.not_to raise_error
      expect { subject.parse("abstract protected method Foo : Bar") }.not_to raise_error
      expect { subject.parse("abstract private method Foo : Bar") }.not_to raise_error
      expect { subject.parse("abstract static method Foo : Bar") }.not_to raise_error
      expect { subject.parse("abstract static public method Foo : Bar") }.not_to raise_error
      expect { subject.parse("abstract static protected method Foo : Bar") }.not_to raise_error
      expect { subject.parse("abstract static private method Foo : Bar") }.not_to raise_error

      # This would just be way too many permutations
      expect { subject.parse("abstract static private method Foo()") }.not_to raise_error
      expect { subject.parse("abstract static private method Foo(this : Baz)") }.not_to raise_error
      expect { subject.parse("abstract static private method Foo(this : Baz, that : Qux)") }.not_to raise_error

      expect { subject.parse("abstract static private method Foo() : Bar") }.not_to raise_error
      expect { subject.parse("abstract static private method Foo(this : Baz) : Bar") }.not_to raise_error
      expect { subject.parse("abstract static private method Foo(this : Baz, that : Qux) : Bar") }.not_to raise_error
    end
  end

  describe '#class_relationship_definition' do
    subject { described_class.new.class_relationship_definition }

    it "should parse correctly" do
      expect { subject.parse("generalizes Foo") }.not_to raise_error
      expect { subject.parse("realizes Foo") }.not_to raise_error
    end
  end

  describe '#relationship_definition' do
    subject { described_class.new.relationship_definition }

    it "should parse correctly" do
      expect { subject.parse("dependency Foo") }.not_to raise_error
      expect { subject.parse("association Foo") }.not_to raise_error
      expect { subject.parse("aggregation Foo") }.not_to raise_error
      expect { subject.parse("composition Foo") }.not_to raise_error
      expect { subject.parse("directional dependency Foo") }.not_to raise_error
      expect { subject.parse("directional association Foo") }.not_to raise_error
      expect { subject.parse("directional aggregation Foo") }.not_to raise_error
      expect { subject.parse("directional composition Foo") }.not_to raise_error
      expect { subject.parse("bidirectional dependency Foo") }.not_to raise_error
      expect { subject.parse("bidirectional association Foo") }.not_to raise_error
      expect { subject.parse("bidirectional aggregation Foo") }.not_to raise_error
      expect { subject.parse("bidirectional composition Foo") }.not_to raise_error
    end
  end

  describe '#class_definition' do
    subject { described_class.new.class_definition }

    it "should parse correctly" do
      expect { subject.parse("class Foo") }.not_to raise_error
      expect { subject.parse("abstract class Foo") }.not_to raise_error
      expect { subject.parse("interface class Foo") }.not_to raise_error
      expect { subject.parse("class Foo{}") }.not_to raise_error
      expect { subject.parse("class Foo {}") }.not_to raise_error
      expect { subject.parse("class Foo     {}") }.not_to raise_error
      expect { subject.parse("class Foo{ }") }.not_to raise_error
      expect { subject.parse("class Foo{   }") }.not_to raise_error
      expect { subject.parse("class Foo   {   }") }.not_to raise_error
      expect { subject.parse("class Foo     {     \n   ;   \n \n    ;   ;  }") }.not_to raise_error
      expect { subject.parse("class Foo { field Foo; method Bar }") }.not_to raise_error
    end
  end

end
