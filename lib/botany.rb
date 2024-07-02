module Botany
  class Error < StandardError; end
end

require_relative 'botany/enumerating'
require_relative 'botany/logging'
require_relative 'botany/performing'
require_relative 'botany/scheduling'
require_relative 'botany/version'

require_relative 'botany/bot'

require_relative 'botany/cli'
