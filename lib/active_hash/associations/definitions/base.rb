# frozen_string_literal: true

module ActiveHash
  module Associations
    module Definitions
      class Base
        attr_accessor :name, :options

        def initialize(name, options)
          @name = name
          @options = options
        end
      end
    end
  end
end
