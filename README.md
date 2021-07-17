# ActiveHash::Associations::Definitions

Keep association definitions for [active_hash](https://github.com/zilkey/active_hash).

## Dependencies

* ruby 2.4+
* activesupport 5.0+
* active_hash 3.0+

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_hash-associations-definitions'
```

Then execute:

    $ bundle

## Usage

Inlcude additional `ActiveHash::Associations::Definitions` and use `has_many` and `belongs_to` as usual.
For example:

```ruby
class Item < ActiveHash::Base
  include ActiveHash::Associations
  include ActiveHash::Associations::Definitions

  field :parent_id

  belongs_to :parent, foreign_key: :parent_id, class_name: self.name
  has_many :children, foreign_key: :parent_id, class_name: self.name
end
```

You can access association definitions as follows:

```ruby
Item.association_definition(:parent)
#=> #<ActiveHash::Associations::Definitions::BelongsTo:... @name=:parent, @options={:foreign_key=>:parent_id, :class_name=>"Item"}>
Item.association_definition(:children)
#=> #<ActiveHash::Associations::Definitions::HasMany:... @name=:children, @options={:foreign_key=>:parent_id, :class_name=>"Item"}>
```

## Contributing

Bug reports and pull requests are welcome at https://github.com/kanety/active_hash-associations-definitions.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
