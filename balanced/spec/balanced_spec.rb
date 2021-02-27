require './balanced.rb'

describe Balanced do

  describe '::balanced_fragment_length' do
    it 'finds the smallest balanced substring' do
      expect(Balanced.balanced_fragment_length('azABaabza')).to eq('ABaab')
      expect(Balanced.balanced_fragment_length('azAabBZ')).to eq('Aa')
      expect(Balanced.balanced_fragment_length('TacoCat')).to eq(-1)
      expect(Balanced.balanced_fragment_length('AcZCbaBz')).to eq('AcZCbaBz')
      expect(Balanced.balanced_fragment_length('abcdefghijklmnopqrstuvwxyz')).to eq(-1)
      expect(Balanced.balanced_fragment_length('abcdefgHIJABCDEFGahij')).to eq('bcdefgHIJABCDEFGahij')
      expect(Balanced.balanced_fragment_length('catAttaCaTtaca')).to eq('Tt')
      expect(Balanced.balanced_fragment_length('catAttaCattacTa')).to eq('AttaCattacT')
    end
  end
end