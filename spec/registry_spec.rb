require 'spec_helper'

describe HandlerRegisterable::Registry do
  class TestHandlerRegistry
    extend HandlerRegisterable::Registry
  end

  subject { TestHandlerRegistry }

  describe 'obtain' do
    context 'when no handler is found for the given condition' do
      it "raises an exception" do
        expect { subject.obtain('unknown') }.to raise_error(HandlerRegisterable::Exceptions::NoHandlerAccepted)
      end

      it "is a standard error which can be caught" do
        rescued = false
        begin
          subject.obtain('this handler does not exist')
        rescue
          rescued = true
        end

        expect(rescued).to be_truthy
      end
    end

    context 'when no handler is found but a default has been set' do
      let(:default_handler) do
        Class.new do
          def initialize(condition)
            @condition = condition
          end
        end
      end

      around :each do |example|
        original = TestHandlerRegistry.default
        TestHandlerRegistry.default = default_handler

        example.run

        TestHandlerRegistry.default = original
      end

      it 'will call the default handler' do
        expect(default_handler).to receive(:new)
        subject.obtain('unknown')
      end

      it 'will not raise an exception' do
        expect { subject.obtain('unknown') }.to_not raise_error
      end
    end
  end

  context 'when a handler is found for the given condition' do
    let(:handler_one) do
      Class.new do
        def initialize(condition)
          @condition = condition
        end

        def self.handles?(condition)
          condition == :test
        end
      end
    end

    let(:handler_two) do
      Class.new do
        def initialize(condition)
          @condition = condition
        end

        def self.handles?(condition)
          condition == :other_test
        end
      end
    end

    it 'returns the correct handler' do
      TestHandlerRegistry.register handler_one, :handler_one
      TestHandlerRegistry.register handler_two, :handler_two

      expect(TestHandlerRegistry.obtain(:test)).to be_an_instance_of(handler_one)
      expect(TestHandlerRegistry.obtain(:other_test)).to be_an_instance_of(handler_two)
    end
  end
end
