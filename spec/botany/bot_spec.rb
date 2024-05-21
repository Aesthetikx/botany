# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Botany::Bot do
  it 'wants a #perform method implemented' do
    bot = described_class.new

    expect { bot.perform }.to raise_error Botany::Error, /should implement #perform/
  end
end
