module Botany
  class Bot
    extend Botany::Enumerating
    extend Botany::Scheduling

    def perform
      raise Botany::Error, "#{self.class.name} should implement #perform"
    end
  end
end
