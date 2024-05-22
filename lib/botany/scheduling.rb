module Botany
  module Scheduling
    def schedule &block
      if block_given?
        instance_eval &block
      else
        schedule_entries
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
