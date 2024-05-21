module Botany
  class Bot
    def perform
      raise Botany::Error, "#{self.class.name} should implement #perform"
    end
  end
end
