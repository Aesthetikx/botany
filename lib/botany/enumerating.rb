module Botany
  module Enumerating
    prepend Enumerable

    def all
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

    def each &block
      if block_given?
        all.each &block
      else
        to_enum :each
      end
    end
  end
end
