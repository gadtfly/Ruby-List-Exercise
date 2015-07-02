require 'rspec/autorun'

class Cons
  attr_accessor :car
  attr_accessor :cdr

  def self.list(array)
    self.new(array.shift, self.list(array)) unless array.empty?
  end

  def initialize(car, cdr)
    self.car, self.cdr = car, cdr
  end

  def ==(other)
    self.car == other.car && self.cdr == other.cdr
  end

  def to_a
    [self.car] + self.cdr.to_a
  end

  def size
    self.cdr ? 1 + cdr.size : 1
  end

  def remove_all(x)
    cdr = self.cdr ? self.cdr.remove_all(x) : nil
    self.car == x ? cdr : Cons.new(self.car, cdr)
  end
end



RSpec.describe Cons do
  describe '::list' do
    it { expect(Cons.list([1,2,3])).to eq(Cons.new(1, Cons.new(2, Cons.new(3, nil)))) }
  end

  describe '#==' do
    it { expect(Cons.list([1,2,3])).to eq Cons.list([1,2,3])}
  end

  describe '#to_a' do
    it { expect(Cons.list([1,2,3]).to_a).to eq([1,2,3]) }
  end

  describe '#size' do
    it { expect(Cons.list([1,2,3]).size).to eq(3) }
  end

  describe '#remove_all' do
    it { expect(Cons.list([1,2,2,3]).remove_all(1).to_a).to eq([2,2,3]) }
    it { expect(Cons.list([1,2,2,3]).remove_all(2).to_a).to eq([1,3]) }
    it { expect(Cons.list([1,2,2,3]).remove_all(3).to_a).to eq([1,2,2]) }
  end
end
