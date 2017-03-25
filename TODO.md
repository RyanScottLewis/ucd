# TODO

* Atom, VIM, etc color schemes/snippets
* Use https://github.com/glejeune/Ruby-Graphviz
* "interface class" feels weird.
* Pass multiple types:
  ucd examples/alias.ucd -o examples -t png,dot,svg
* Reopen class:
  class Foo {
    field name: String
  }
  class Foo {
    field email: String
  }
* Define outside class:
  class Foo
  interface class Bar
  Foo field name : String
  Foo realizes Bar
* Auto define missing classes
* Empty classes
  Right now: class A {}
  TODO: class A
* Pass formatter arguments to formatter
  Graphviz: Graph, node, edge attributes..
* System and user config files, mostly for formatter default settings
* Comments
  * Support all 3 styles: #, //, /* ... \*/
    * Pros
      * Users can guess and always be correct
    * Cons
      * Looks messy
      * More complex parser definition
* Option to add relationship's fields and methods (Not class relationships)
  * class Animal {
      field name : String
    }

    class Dog {
      method bark

      generalizes Animal
    }

    dog.methods => [:name, :bark]

* Aliases?
  * Pros
    * Less to type
  * Cons
    * No autocomplete for defined aliases in editors
  * Examples
    * alias name_field as field name : String

      class Cat {
        name_field
      }

      class Dog {
        name_field
      }
* Macros?

  * Examples
    * macro has_many(name, type) {
        field {{name}} : Array({{type}})

        aggregation {{type}} {{name}} *
      }

      class Dog {
        has_many toys, Toy
      }

      # Same as:
      # class Dog {
      #   field toys : Array(Toy)
      #
      #   aggregation Toy toys *
      # }

      class Toy {
      }
