# frozen_string_literal: true

require 'active_hash'
require 'active_support/all'

require_relative 'definitions/version'
require_relative 'definitions/base'
require_relative 'definitions/belongs_to'
require_relative 'definitions/has_many'

module ActiveHash
  module Associations
    module Definitions
      extend ActiveSupport::Concern

      included do
        class_attribute :association_definitions
        self.association_definitions = {}
      end

      class_methods do
        def has_many(name, options)
          self.association_definitions = association_definitions.merge(
            name.to_sym => HasMany.new(name, options)
          )
          super
        end

        def belongs_to(name, options)
          self.association_definitions = association_definitions.merge(
            name.to_sym => BelongsTo.new(name, options)
          )
          super
        end

        def association_definition(name)
          association_definitions[name]
        end
      end
    end
  end
end
