require 'spec_helper'

describe HandlerRegisterable::Exceptions::NoHandlerAccepted do
  subject { described_class.new }

  it 'returns a custom message' do
    expect(subject.message).to eq('No Handler Accepted')
  end

  it 'is an instance of StandardError' do
    expect(subject).to be_a_kind_of(StandardError)
  end
end
