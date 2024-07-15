require 'gli'

module Botany
  class CLI
    extend GLI::App

    version Botany::VERSION

    program_desc 'Program description'

    desc 'Update description'
    command :update do |c|
      c.action do |_global_options, _options, _arguments|
        Botany::Scheduling.update_cron!
      end
    end

    desc 'Run description'
    command :run do |c|
      c.action do |_global_options, _options, arguments|
        task = arguments.first

        klass_name, method = task.split '.'

        method ||= 'perform'

        bot = Object.const_get klass_name

        start = Time.now

        Botany.logger.info { "Starting #{bot}.#{method} at #{start}" }

        bot.new.send method

        stop = Time.now

        duration = stop - start

        Botany.logger.info { "Finished #{bot}.#{method} (#{duration})" }
      end
    end
  end
end
