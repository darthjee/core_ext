shared_examples 'a class with change_key method' do
  let(:hash) do
    { 'a' => 1, b: 2, c: { d: 3, e: 4 }, f: [{ g: 5 }, { h: 6 }] }
  end

  describe :change_keys do

    it_behaves_like 'a mnethod that is able to change keys', :change_keys
    it 'does not affects the original hash' do
      expect do
        hash.change_keys(recursive: true) { |k| "foo_#{k}" }
      end.not_to change { hash }
    end
  end

  describe :change_keys! do
    it_behaves_like 'a mnethod that is able to change keys', :change_keys!

    it 'affects the original hash' do
      expect do
        hash.change_keys!(recursive: true) { |k| "foo_#{k}" }
      end.to change { hash }
    end
  end
end

shared_examples 'a mnethod that is able to change keys' do |method|
  context 'with simple level hash' do
    let(:hash) { { 'a' => 1, b: 2 } }

    context 'with string transformation' do
      let(:result) do
        hash.public_send(method) { |k| "foo_#{k}" }
      end

      it 'uses the block return as key' do
        expect(result).to eq('foo_a' => 1, 'foo_b' => 2)
      end
    end

    context 'with symbol transformation' do
      let(:result) do
        hash.public_send(method) { |k| "foo_#{k}".to_sym }
      end

      it 'uses the block return as key' do
        expect(result).to eq(foo_a: 1, foo_b: 2)
      end
    end
  end

  context 'with recursive hash' do
    let(:hash) { { 'a' => 1, b:  { c: 3, 'd' => 4 } } }
    let(:result) { hash.public_send(method, options) { |k| "foo_#{k}" } }
    let(:expected) do
      { 'foo_a' => 1, 'foo_b' =>  { 'foo_c' => 3, 'foo_d' => 4 } }
    end

    context 'when no options are given' do
      let(:options) { {} }

      it 'applies the block recursively' do
        expect(result).to eq(expected)
      end
    end

    context 'when options are given' do
      let(:options) { { recursive: recursive } }

      context 'with recursion' do
        let(:recursive) { true }

        it 'applies the block recursively' do
          expect(result).to eq(expected)
        end
      end

      context 'without recursion' do
        let(:recursive) { false }
        let(:expected) { { 'foo_a' => 1, 'foo_b' =>  { c: 3, 'd' => 4 } } }

        it 'does not applies the block recursively' do
          expect(result).to eq(expected)
        end
      end
    end
  end

  it 'apply recursion on many levels' do
    hash = { a: 1, b: { c: 2, d: { e: 3, f: 4 } } }
    expected = { foo_a: 1, foo_b: { foo_c: 2, foo_d: { foo_e: 3, foo_f: 4 } } }
    expect(hash.public_send(method, recursive: true) { |k| "foo_#{k}".to_sym }).to eq(expected)
  end

  it 'respect options on recursion' do
    hash = { a: 1, b: { c: 2, d: { e: 3, f: 4 } } }
    expected = { foo_a: 1, foo_b: { c: 2, d: { e: 3, f: 4 } } }
    expect(hash.public_send(method, recursive: false) { |k| "foo_#{k}".to_sym }).to eq(expected)
  end
end
