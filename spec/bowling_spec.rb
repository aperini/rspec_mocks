require 'bowling'

describe 'A bowling score' do
  context 'without strikes nor spares' do
    it 'is 0 before any hits' do
      bowling = Bowling.new
      expect(bowling.score).to eq 0
    end
  end

  context 'with strikes or spares' do
    it 'remains 0 with two spares' do
      bowling = Bowling.new
      2.times { bowling.hit(0) }
      expect(bowling.score).to eq 0
    end

    it 'sums the pin count for each roll' do
      bowling = Bowling.new
      20.times { bowling.hit(4) }
      expect(bowling.score).to eq 80
    end
  end

end
