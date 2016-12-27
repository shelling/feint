module Feint
  class Presenter
    def initialize(model) # :nodoc:
      @model = model
    end

    class << self
      # Takes a list of columns
      def attributes(*columns)
        columns.each do |column|
          define_method column do
            @model.send(column)
          end
        end
      end

      # Take a list of mappiings
      # { old_column_name => new_column_name }
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
