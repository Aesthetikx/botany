describe Botany::Enumerating do
  it 'allows for the enumeration of bots' do
    bot_klass = Class.new Botany::Bot

    Botany::Bot.to_a.should eq [bot_klass]
  end
end
