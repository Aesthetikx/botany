describe Botany::Enumerating do
  it 'allows for the enumeration of bots' do
    bot_klass = Class.new Botany::Bot

    expect(Botany::Bot.to_a).to eq [bot_klass]
  end
end
