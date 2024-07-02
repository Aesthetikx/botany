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

# Load end user bots directory with Zeitwerk
require 'zeitwerk'
loader = Zeitwerk::Loader.new
loader.push_dir File.join Dir.pwd, 'bots'
loader.setup
