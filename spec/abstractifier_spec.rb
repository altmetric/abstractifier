# encoding: UTF-8

require 'abstractifier'

RSpec.describe Abstractifier do
  let(:instance) { described_class.new(max: 50, min: 20) }

  it 'elides to sentence boundaries' do
    expect(
      instance.abstractify(
        'This is the first sentence. This is the second sentence.'
      )
    ).to eq('This is the first sentence.')
  end

  it 'elides mid-sentence when no suitable sentence boundary.' do
    expect(
      instance.abstractify(
        'This is short. This is much longer second sentence, which much be elided mid-sentence.'
      )
    ).to eq('This is short. This is much longer second sentence…')
  end

  it 'elides mid-word when too long' do
    expect(
      instance.abstractify(
        'Supercalifragilisticexpialidociousisareallylongwordthatmustbetruncated'
      )
    ).to eq('Supercalifragilisticexpialidociousisareallylongword…')
  end

  it 'retains trailing punctuation from sentence boundaries' do
    expect(
      instance.abstractify(
        'I really think this is a good idea, personally! But whatever you think, I guess.'
      )
    ).to eq('I really think this is a good idea, personally!')
  end

  it 'retains trailing punctuation from sentence boundaries' do
    expect(
      instance.abstractify(
        'I really think this is a good idea, personally! But whatever you think, I guess.'
      )
    ).to eq('I really think this is a good idea, personally!')
  end

  it 'removes trailing punctuation from word boundaries' do
    expect(
      instance.abstractify(
        'This sentence should be truncated in a few words, but should have no trailing punctuation'
      )
    ).to eq('This sentence should be truncated in a few words…')
  end
end
