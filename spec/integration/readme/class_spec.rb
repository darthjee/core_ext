# frozen_string_literal: false

describe Class do
  describe 'readme' do
    let(:instance) { klass.new }
    let(:other)    { klass.new }

    describe '#default_value' do
      let(:klass) do
        Class.new do |clazz|
          clazz.send(:default_value, :name, 'John')
        end
      end

      it 'adds method with default value' do
        expect(instance.name)
          .to eq('John')
      end

      it 'returns the same instance' do
        expect(instance.name)
          .to equal(other.name)
      end
    end

    describe '#default_values' do
      let(:klass) do
        Class.new do |clazz|
          clazz.send(
            :default_values, :name, :nick_name, 'John'
          )
        end
      end

      it 'adds methods with default value' do
        expect(instance.name)
          .to eq('John')
      end

      it 'adds methods with default value on both methods' do
        expect(instance.nick_name)
          .to eq('John')
      end

      it 'returns the same instance' do
        expect(instance.name)
          .to equal(other.name)
      end
    end

    describe '#default_reader' do
      let(:klass) do
        Class.new do |clazz|
          clazz.send(:attr_writer, :name)
          clazz.send(:default_reader, :name, 'John Doe')
        end
      end

      it 'adds method returning default value' do
        expect(instance.name).to eq('John Doe')
      end

      context 'when value is changed' do
        before do
          instance.name = 'Joe'
        end

        it 'returns new value' do
          expect(instance.name).to eq('Joe')
        end

        context 'when it is changed to nil' do
          before do
            instance.name = nil
          end

          it { expect(instance.name).to be_nil }
        end

        context 'when another instance calls the method' do
          it 'does not change the result of another instance' do
            expect(instance.name).not_to eq(other.name)
          end
        end
      end
    end

    describe '#default_readers' do
      let(:klass) do
        Class.new do |clazz|
          clazz.send(:attr_writer, :cars, :houses)
          clazz.send(:default_readers, :cars, :houses, 'none')
        end
      end

      it 'adds method returning default value' do
        expect(instance.cars).to eq('none')
      end

      it 'returns the same instance for both methods' do
        expect(instance.cars).to equal(instance.houses)
      end

      context 'when setting cars' do
        before { instance.cars = ['volvo'] }

        it 'sets the value' do
          expect(instance.cars).to eq(['volvo'])
        end

        it 'does not change the value on the other method' do
          expect(instance.houses).to eq('none')
        end

        context 'when setting to nil' do
          before { instance.cars = nil }

          it { expect(instance.cars).to be_nil }
        end
      end
    end
  end
end
