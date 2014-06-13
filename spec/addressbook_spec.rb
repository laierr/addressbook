require 'spec_helper'

describe Addressbook do
  subject { Addressbook.new }

  it 'works' do
    expect(subject).to be_kind_of(Object)
  end

  context '#put' do
    let(:name) { 'Dogemon' }
    let(:address) { 'Much Wow Street, 412, Tel Aviv' }

    it 'associates an address with a person' do
      subject.put(name, address)
      expect(subject.get(name)).to eql(address)
    end
  end

  context '#get' do
    let(:name) { 'Doge' }
    let(:address) { 'Wow Street, 412, Tel Aviv' }

    before do
      subject.put(name, address)
    end

    it 'returns address for name' do
      expect(subject.get(name)).to eql(address)
    end

    it 'returns nil if person address is unknown' do
      expect(subject.get('Dogemon')).to be_nil
    end
  end

  context '#has?' do
    let(:name) { 'Doge' }
    let(:address) { 'Wow Street, 412, Tel Aviv' }

    before do
      subject.put(name, address)
    end

    it 'returns true if person is inside the book' do
      expect(subject.has?(name)).to be(true)
    end

    it 'returns false otherwise' do
      expect(subject.has?('Dogemon')).to be(false)
    end
  end

  context '#list' do
    let(:names) { ['Doge', 'Wow']}

    it 'returns empty array if no addresses' do
      expect(subject.list).to be_empty
    end

    it 'retuns array of names' do
      names.each_with_index do |name, index|
        subject.put name, "Much Street #{index}, Tel Aviv"
      end

      expect(subject.list).to eql(names)
    end
  end

  context '#near' do
    let(:name) { 'Doge' }
    let(:address) { 'Wow Street, 412, Tel Aviv' }

    before do
      subject.put(name, address)
      subject.put('Dogemon', 'Such Street, 912, London')
    end

    it 'returns empty array if nothing was found' do
      expect(subject.near('Seoul')).to eql([])
    end

    it 'returns array of results' do
      expect(subject.near('Tel Aviv')).to eql([name])
    end
  end

  context '#burn' do
    let(:name) { 'Doge' }
    let(:address) { 'Wow Street, 412, Tel Aviv' }

    before do
      subject.put(name, address)
    end

    it 'clears the book' do
      expect { subject.burn }.to change(subject, :list).to([])
    end
  end
end
