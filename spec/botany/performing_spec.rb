describe Botany::Performing do
  it 'wants a #perform method implemented' do
    bot = Botany::Bot.new

    expect { bot.perform }.to raise_error Botany::Error, /should implement #perform/
  end
end
