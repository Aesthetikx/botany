module Botany
  module Enumerating
    prepend Enumerable

    def all
      klasses = ObjectSpace.each_object Class

      klasses.select { |klass| klass < self }
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
