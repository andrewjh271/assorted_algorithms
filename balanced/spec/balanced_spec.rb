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
      expect(Balanced.balanced_fragment_length('jsflsdifsjdflisjfsldkfjsldfkjdlsfiajfljlkclakdsjfasldkfjasifjsLFJSLFSKFJDKFJjkjsfladfjJKD')).to eq('Jj')
    end
  end

  describe '::balanced_fragment_length2' do
    it 'finds the smallest balanced substring' do
      expect(Balanced.balanced_fragment_length2('azABaabza')).to eq('ABaab')
      expect(Balanced.balanced_fragment_length2('azAabBZ')).to eq('Aa')
      expect(Balanced.balanced_fragment_length2('TacoCat')).to eq(-1)
      expect(Balanced.balanced_fragment_length2('AcZCbaBz')).to eq('AcZCbaBz')
      expect(Balanced.balanced_fragment_length2('abcdefghijklmnopqrstuvwxyz')).to eq(-1)
      expect(Balanced.balanced_fragment_length2('abcdefgHIJABCDEFGahij')).to eq('bcdefgHIJABCDEFGahij')
      expect(Balanced.balanced_fragment_length2('catAttaCaTtaca')).to eq('Tt')
      expect(Balanced.balanced_fragment_length2('catAttaCattacTa')).to eq('AttaCattacT')
      expect(Balanced.balanced_fragment_length2('jsflsdifsjdflisjfsldkfjsldfkjdlsfiajfljlkclakdsjfasldkfjasifjsLFJSLFSKFJDKFJjkjsfladfjJKD')).to eq('Jj')
    end
  end

  describe '::balanced_fragment_length3' do
    it 'finds the smallest balanced substring' do
      expect(Balanced.balanced_fragment_length3('azABaabza')).to eq('ABaab')
      expect(Balanced.balanced_fragment_length3('azAabBZ')).to eq('Aa')
      expect(Balanced.balanced_fragment_length3('TacoCat')).to eq(-1)
      expect(Balanced.balanced_fragment_length3('AcZCbaBz')).to eq('AcZCbaBz')
      expect(Balanced.balanced_fragment_length3('abcdefghijklmnopqrstuvwxyz')).to eq(-1)
      expect(Balanced.balanced_fragment_length3('abcdefgHIJABCDEFGahij')).to eq('bcdefgHIJABCDEFGahij')
      expect(Balanced.balanced_fragment_length3('catAttaCaTtaca')).to eq('Tt')
      expect(Balanced.balanced_fragment_length3('catAttaCattacTa')).to eq('AttaCattacT')
      expect(Balanced.balanced_fragment_length3('jsflsdifsjdflisjfsldkfjsldfkjdlsfiajfljlkclakdsjfasldkfjasifjsLFJSLFSKFJDKFJjkjsfladfjJKD')).to eq('Jj')
    end
  end
end