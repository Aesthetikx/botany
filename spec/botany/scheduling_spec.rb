require 'spec_helper'

describe Botany::Scheduling do
  describe '::schedule' do
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
      expect(klass.schedule).to eq [
        ['0 0 27-31 * *'],
        [:sunday],
        [1.hour],
        [3.days, { at: ['4:30 am', '6:00 pm'] }]
      ]
    end
  end
end
