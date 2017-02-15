require 'spec_helper'

describe Srack::Server do
  it 'should respond to .start' do
    expect(described_class).to respond_to(:start)
  end
end
