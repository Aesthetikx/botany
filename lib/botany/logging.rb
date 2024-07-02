require 'logger'

module Botany
  class << self
    attr_writer :logger

    def logger
      @logger ||= ::Logger.new $stdout, progname: name
    end
  end

  module Logging
    def logger
      @logger ||= make_a_bot_logger
    end

    private

    def make_a_bot_logger
      Botany.logger.dup.tap do |logger|
        logger.progname += "/Bot/#{self.class.name}"
      end
    end
  end
end
