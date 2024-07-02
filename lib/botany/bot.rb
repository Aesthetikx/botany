module Botany
  class Bot
    extend Botany::Enumerating
    extend Botany::Scheduling
    include Botany::Logging
    include Botany::Performing
  end
end
