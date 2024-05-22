describe Botany::Scheduling do
  describe '#schedule' do
    subject :klass do
      Class.new do
        extend Botany::Scheduling

        schedule do
          every '0 0 27-31 * *'
          every :sunday
          every 1.hour
          every 3.days, at: ['4:30 am', '6:00 pm']
        end
      end
    end

    it 'stores a schedule' do
      klass.schedule.should eq [
        ['0 0 27-31 * *'],
        [:sunday],
        [1.hour],
        [3.days, { at: ['4:30 am', '6:00 pm'] }]
      ]
    end
  end

  describe '::schedule_whenever!' do
    before do
      Class.new Botany::Bot do
        def self.name
          'MyBot'
        end

        schedule do
          every :wednesday
        end
      end
    end

    it 'creates valid cron' do
      options = { string: 'Botany::Scheduling.schedule_whenever! self' }

      job_list = Whenever::JobList.new options

      cron = job_list.generate_cron_output

      cron.should include '0 0 * * 3'
    end
  end
end
