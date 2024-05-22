module Botany
  module Scheduling
    def schedule &block
      if block_given?
        instance_eval &block
      else
        schedule_entries
      end
    end

    def whenever_configuration_entries
      schedule_entries.map do |entry|
        task = "#{name}.perform"

        lambda do
          every *entry do
            run_bot task
          end
        end
      end
    end

    def self.schedule_whenever! config
      config.job_type :run_bot, 'cd :path && bundle exec botany run :task :output'

      Botany::Bot.each do |bot|
        bot.whenever_configuration_entries.each do |entry|
          config.instance_exec &entry
        end
      end
    end

    private

    def every *args
      schedule_entries << args
    end

    def schedule_entries
      @schedule_entries ||= []
    end
  end
end
