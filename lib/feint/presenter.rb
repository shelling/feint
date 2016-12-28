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
    end
  end
end
