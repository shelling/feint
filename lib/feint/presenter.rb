module Feint
  class Presenter
    def initialize(model) # :nodoc:
      @model = model
    end

    class << self
      # @param columns [Symbol] list
      def attributes(*columns)
        columns.each do |column|
          define_method column do
            @model.send(column)
          end
        end
      end

      # @param mappings [Hash] keys for old names and values for new names
      def transform(mappings)
        mappings.each do |old, new|
          define_method new do
            @model.send(old)
          end
        end
      end

      # @param name [Symbol]
      # @param options [Hash]
      # options[:key] is used as field name
      # options[:type] is used to check type
      def attribute(name, options = {})
        type = options[:type] || Object
        key  = options[:key] || name

        define_method key do
          value = @model.send(name)

          if value.is_a?(type)
            return value
          else
            raise TypeError, "#{name} should be #{type} and is #{value.class}"
          end
        end
      end
    end
  end
end
